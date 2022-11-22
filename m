Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC61107A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Nov 2022 17:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6619CC433D6;
	Tue, 22 Nov 2022 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669137834;
	bh=qaoX8JS/r3B9Mh36lrvWBGRiKnKRUTQSKQq3gRh6e6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZiiNcDWMpUYM6wDzFI775zdShVfU+e0I05DnaR6XtomWpxTqZHUXvKOtkuDh85Uoq
	 8d6FJ9sXQVF/8cbj8xSdYMUr3MTlkwgs88Og1eKXM2oyfskKTkTvjBejMA/nLQnnep
	 pHyJmbmhGqMVoY/GQ//XEcrPEeY13HeJ5MayDKkUx0tITCUYizgvC+mCKvXTQb1Uz/
	 Piwra5EbgmN6lPKMUhrwEVJOJKSd1r3D+yiT8si2HaQmagPt3yMh5L/SHNq/2txfdD
	 UQZTpoqx+/Wh9rPgIHNV0WmNy5PQnqWlmBjtfULQnNHiprnsZ/30zFxTpcun3qmxAM
	 WwDs6+uENfhqg==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 37/37] mm/damon/sysfs.c:1770:1: warning: the frame size of 4112 bytes is larger than 2048 bytes
Date: Tue, 22 Nov 2022 17:23:52 +0000
Message-Id: <20221122172352.108928-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202211201007.rrcqTUxE-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 20 Nov 2022 10:09:58 +0800 kernel test robot <lkp@intel.com> wrote:

> [-- Attachment #1: Type: text/plain, Size: 1519 bytes --]
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   06638cb072cbac35ea150107af1992c5249cc671
> commit: 06638cb072cbac35ea150107af1992c5249cc671 [37/37] (not-for-sending) mm/damon/sysfs: Add a file for simple checking memcg ids and paths
> config: loongarch-allmodconfig
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?id=06638cb072cbac35ea150107af1992c5249cc671
>         git remote add sj https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git
>         git fetch --no-tags sj damon/next
>         git checkout 06638cb072cbac35ea150107af1992c5249cc671
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash mm/damon/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/damon/sysfs.c: In function 'debug_show':
> >> mm/damon/sysfs.c:1770:1: warning: the frame size of 4112 bytes is larger than 2048 bytes [-Wframe-larger-than=]
>     1770 | }
>          | ^

Thank you for finding this!  Fixed:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=a3845859246e47f3f4b5bc8ddba4a435a0fb4611


Thanks,
SJ
