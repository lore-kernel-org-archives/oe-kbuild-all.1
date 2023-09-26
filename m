Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8A125C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 08:56:14 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so12894836e87.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695718572; x=1696323372; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0gjw7VpIsI24FsGpgI1LIRHokyuddV6bL4UWQKqi1zo=;
        b=hl8VodTOryJ45fNy4nuRQqWo64UYVKbkbAjCZkML1xkU/pSr2pW545OSjtD8U3ysEX
         Jj1tXceNMljgPFn5eprwXtFmwNzhaWhsrlefhvKYgWNmi7c/8VeLec4sUTqR9VvX7jZW
         I8WenSetoe0hcCQKRFIfTBBxp9w8YnnSFsV7As1izuSFC8RcmSu3GQ8/0ElAWIKALihK
         9z7v/HJBCx1xu58zjeXXjnvCyktdDf8LHMe3sprFJUTZ0Gr52xI4eJ8FfNAgVGATK6kq
         KY20dfMZU0vaX/MeTdWUvFMrWn2p7dXG6wtkvOqkE4eRPcDUA1aGJYhjYcEwoUuFdUlC
         kIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695718572; x=1696323372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gjw7VpIsI24FsGpgI1LIRHokyuddV6bL4UWQKqi1zo=;
        b=rmGY7HIBP7P+LYUJSlpUnaX/fkbCnPNOe28NM2iMtMLJU9OgJuf0Tynm4xoC82WhLt
         32UU62Qnz2npGTqxVM0738MC4I+zXCbcaldKDXhKqo/ClhZm4Q2EdFGknJ/xohWUW3te
         xOzGq3TynyX8qWjFpkgn4JdHiJUtC/3YvXxyrtIDN+iJAgnsjmlQDrOzFaKWeiF7wwWC
         rpS5TfoyW62FQiNGxUS4irAXC//mOhNFy06K8neGjaXqqYUrvL3SIiutQXWxjWaZ5MxI
         nSDzMo88hh/IO7GIojUr+BOGvfIgp6TT24PcPmvyDRQpvaUsq5dOM/6rl4cSsfbXeXZE
         lzpQ==
X-Gm-Message-State: AOJu0YyK0D35pFENmZDdafcHapYEzO+I/0CuRzjmWY1kMW6sE3J8M9GN
	ayWyULNhrWZjAkNiBjYDPBM=
X-Google-Smtp-Source: AGHT+IFe/z24ooLWaNmEm2q+tfoIOpZ0ZitAPQIFlC7dpmZD0mw6bI5lxv0spRkMJKW0xNl0wCj9ig==
X-Received: by 2002:a19:6905:0:b0:503:26b0:e126 with SMTP id e5-20020a196905000000b0050326b0e126mr6168408lfc.59.1695718572192;
        Tue, 26 Sep 2023 01:56:12 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id a7-20020a19f807000000b004fe36b790a1sm2153202lff.128.2023.09.26.01.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 01:56:11 -0700 (PDT)
Date: Tue, 26 Sep 2023 11:56:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: kernel test robot <yujie.liu@intel.com>
Cc: Michal Simek <monstr@monstr.eu>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	James Morse <james.morse@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Robert Richter <rric@kernel.org>, oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org, 
	Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Dinh Nguyen <dinguyen@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/18] EDAC/synopsys: Add DDRC basic parameters
 infrastructure
Message-ID: <pd3loh247nevscvcajxx2xyugfve3lhu6ydf3gmzsedwlbixrc@ng7bv2adqv2d>
References: <20230920192806.29960-6-fancer.lancer@gmail.com>
 <202309241117.1QIu7Ipb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309241117.1QIu7Ipb-lkp@intel.com>

On Tue, Sep 26, 2023 at 04:07:49PM +0800, kernel test robot wrote:
> Hi Serge,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on ras/edac-for-next]
> [also build test WARNING on linus/master v6.6-rc2 next-20230921]
> [cannot apply to xilinx-xlnx/master bp/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/EDAC-synopsys-Convert-sysfs-nodes-to-debugfs-ones/20230921-035302
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
> patch link:    https://lore.kernel.org/r/20230920192806.29960-6-fancer.lancer%40gmail.com
> patch subject: [PATCH v4 05/18] EDAC/synopsys: Add DDRC basic parameters infrastructure
> config: arm64-randconfig-003-20230924 (https://download.01.org/0day-ci/archive/20230924/202309241117.1QIu7Ipb-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241117.1QIu7Ipb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Closes: https://lore.kernel.org/r/202309241117.1QIu7Ipb-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/edac/synopsys_edac.c:224: warning: Enum value 'SNPS_DQ_32' not described in enum 'snps_dq_width'
> >> drivers/edac/synopsys_edac.c:224: warning: Enum value 'SNPS_DQ_64' not described in enum 'snps_dq_width'
> 
> 
> vim +224 drivers/edac/synopsys_edac.c
> 
> c85ef1323d2330 Serge Semin 2023-09-20  215  
> 9e617225f1d8ba Serge Semin 2023-09-20  216  /**
> 9e617225f1d8ba Serge Semin 2023-09-20  217   * enum snps_dq_width - SDRAM DQ bus width (ECC capable).
> 9e617225f1d8ba Serge Semin 2023-09-20  218   * SNPS_DQ_32:	32-bit memory data width.
> 9e617225f1d8ba Serge Semin 2023-09-20  219   * SNPS_DQ_64:	64-bit memory data width.
> 
> a @ char is required in front of each name
> 
> 9e617225f1d8ba Serge Semin 2023-09-20  220   */
> 9e617225f1d8ba Serge Semin 2023-09-20  221  enum snps_dq_width {
> 9e617225f1d8ba Serge Semin 2023-09-20  222  	SNPS_DQ_32 = 2,
> 9e617225f1d8ba Serge Semin 2023-09-20  223  	SNPS_DQ_64 = 3,
> 9e617225f1d8ba Serge Semin 2023-09-20 @224  };
> 9e617225f1d8ba Serge Semin 2023-09-20  225  

Got it. Thank you kind kernel roBot. I'll fix it in v5.

-Serge(y)

> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
