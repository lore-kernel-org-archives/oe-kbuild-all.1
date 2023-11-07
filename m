Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFE7633
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gb3pyTxo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D097C433C8;
	Tue,  7 Nov 2023 00:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699315646;
	bh=NSNh69IukxERes/YrDimo13ZIAzItkSWh8MFbrH/FXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gb3pyTxoBVwHVb8PVdxGz9M0l9ug4JRUQqMceX/pi7Q1n+UOffuvbH6BB9ASmuSgy
	 /rplQhTPHTsaF0PFP6Ah/7NS7dVONLT12B6OWmY2dnDR6g4qjW/wkbcJHXsm3IbMnA
	 VJlcLuG+2QPt95tOMtVc5CNVnUWpuldPS/Z0KBkrtvXsdC9XOkXNd3mJmfgFDyPXT/
	 6UBImnRJrdV83ovmWeplpQaMZHir04hBH8uoXRUixSFeefoP4P2eIh+2izA7lL+Ffm
	 SoSSpPaN31tMbSW1XCHIYnVeJ3D3GnzGOsmgkot+RnbY1rIL/RSmNkQolzk4+8n//4
	 zy2UYXN64j2rw==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 42/42] mm/damon/sysfs-schemes.c:1869:15: warning: no previous prototype for 'damos_sysfs_get_quota_score'
Date: Tue,  7 Nov 2023 00:07:25 +0000
Message-Id: <20231107000725.98842-1-sj@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202311061837.b0wFOPEh-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Mon, 6 Nov 2023 18:55:34 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   b00bae1288606fa36c98bfcb8400938c39c2bf5b
> commit: b00bae1288606fa36c98bfcb8400938c39c2bf5b [42/42] mm/damon/sysfs-schemes: implement damos quota goal
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311061837.b0wFOPEh-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061837.b0wFOPEh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311061837.b0wFOPEh-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/damon/sysfs-schemes.c:1869:15: warning: no previous prototype for 'damos_sysfs_get_quota_score' [-Wmissing-prototypes]
>     1869 | unsigned long damos_sysfs_get_quota_score(void *arg)
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Thank you for this nice report!  The function is for only internal use, so I
will mark it as 'static'.


Thanks,
SJ

[...]
