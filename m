Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6185247
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 16:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8EDC433C9;
	Sun,  1 Oct 2023 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696176512;
	bh=GbFgxCDqh03tmoV705FRgBIZxu6VY78PDwxjs8VMDU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xq77eHJnRWVq3LYuJOeRLr4snmEZQZ86i294ssC9aTCyZz4t3Ca538GUO4Na0H5a9
	 F971KkXPffH/pAdjfKT/qpGXUgyYcHlTdkSlXmxOH+GkRjL7O/bjhj4jLcSfO0Xuz5
	 +xoGMz9jzne6xje4fVcfpEEX5ZGyFPg8MWuW8DbTDjILNOAk5mxx60nCwn7FUm5Yx6
	 kLI4IEBbl9xKGRZ7UKgT4sbmsIaU/8TIj4HZ6Vt3hsTRtrh4wFxLKbc4JAYxGKLYUI
	 hXePNuIN63VPX7cehQOYMwj+VInKS65himdfTcVDxeRJLxBzZIg7Z8rraAsR1ivIMY
	 R6zgUCdOpBZcA==
From: sj@kernel.org
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 25/28] mm/damon/sysfs-schemes.c:1869:6: warning: no previous prototype for 'damos_sysfs_tried_regions_reset_update_status'
Date: Sun,  1 Oct 2023 16:08:28 +0000
Message-Id: <20231001160828.47310-1-sj@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202310010851.UTmHwpyH-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi robot,

On Sun, 1 Oct 2023 08:50:48 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   ee9e834252d5110f424abdef73f776cd4dc5ceae
> commit: d3dfc5443e1f05dd03955ba5fe214812d0219395 [25/28] mm/damon/sysfs-schemes: update tried regions for only one apply interval
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231001/202310010851.UTmHwpyH-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010851.UTmHwpyH-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310010851.UTmHwpyH-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    mm/damon/sysfs-schemes.c:127:60: error: field 'update_status' has incomplete type
>      127 |         enum damos_sysfs_tried_regions_reset_update_status update_status;
>          |                                                            ^~~~~~~~~~~~~
> >> mm/damon/sysfs-schemes.c:1869:6: warning: no previous prototype for 'damos_sysfs_tried_regions_reset_update_status' [-Wmissing-prototypes]
>     1869 | void damos_sysfs_tried_regions_reset_update_status(struct damon_ctx *ctx)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/damon/sysfs-schemes.c: In function 'damos_sysfs_tried_regions_reset_update_status':
>    mm/damon/sysfs-schemes.c:1876:17: error: 'sysfs_Schemes' undeclared (first use in this function); did you mean 'sysfs_schemes'?
>     1876 |                 sysfs_Schemes->schemes_arr[i]->tried_regions->update_status =
>          |                 ^~~~~~~~~~~~~
>          |                 sysfs_schemes
>    mm/damon/sysfs-schemes.c:1876:17: note: each undeclared identifier is reported only once for each function it appears in

Thank you for this report.  I made a fix for this as a followup commit[1].  I
will squash the fix into the original broken commit and push by today.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=ff3d1bf4122213fbcae73b075149e7cc3f5c0f34


Thanks,
SJ

>
>
> vim +/damos_sysfs_tried_regions_reset_update_status +1869 mm/damon/sysfs-schemes.c
>
>   1868
> > 1869        void damos_sysfs_tried_regions_reset_update_status(struct damon_ctx *ctx)
>   1870        {
>   1871                struct damon_sysfs_schemes *sysfs_schemes =
>   1872                        damon_sysfs_schemes_for_damos_callback;
>   1873                int i;
>   1874
>   1875                for (i = 0; i < sysfs_schemes->nr; i++)
>   1876                        sysfs_Schemes->schemes_arr[i]->tried_regions->update_status =
>   1877                                damos_tried_region_update_idle;
>   1878        }
>   1879
>
