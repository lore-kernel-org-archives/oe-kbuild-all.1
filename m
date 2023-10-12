Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5944A22336;
	Thu, 12 Oct 2023 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ezl8LIgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33593C433C8;
	Thu, 12 Oct 2023 10:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697106276;
	bh=0Ljt2/e3et0ja/EIacPM8+PVdZSTtxr6HVLa0adWuRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ezl8LIgv/hwXINeaG2HyDxNbNKzV7PAKOAn13rz6rHGAMMb1vn+AjsCpUHB6kULoc
	 JQKqKBBQBsnFQOOKmJQuSBWSuJHJSrLVwoJ+oNxd493jMdxkFw4Umt4oumm+F+MI4G
	 I1MguCsBXItmVTZYQQnHIRYZgWY9fWdVLPd3tRNU1OZxaBk1sMo6RTG6wSAFmsmg63
	 t2PBMVvRzi3GYyhaKznQFmFt91OveyfoqGwXxOHvM1seGwg01MwWcNxIYTgSEfp31r
	 RPVvBI7ldeMmFTnakAe9KIp2B84aFmjRIHhrqlnkHwezMa46d/GSX8m9VsgnEKcHHY
	 mcAMfSRnpc8aQ==
Date: Thu, 12 Oct 2023 11:24:32 +0100
From: Lee Jones <lee@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
	devicetree@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Timothy Pearson <tpearson@raptorengineering.com>,
	linux-kernel@vger.kernel.org,
	Georgy Yakovlev <Georgy.Yakovlev@sony.com>
Subject: Re: [PATCH 3/3] mfd: sie-cronos-cpld: Add driver for SIE cronos CPLD
Message-ID: <20231012102432.GG8314@google.com>
References: <2e9763cb4fa258fe11769a4ff1544d96c536a4a2.1696285339.git.sanastasio@raptorengineering.com>
 <202310050807.eDZkgFy5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202310050807.eDZkgFy5-lkp@intel.com>

On Thu, 05 Oct 2023, kernel test robot wrote:

> Hi Shawn,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on lee-mfd/for-mfd-next]
> [also build test WARNING on robh/for-next linus/master v6.6-rc4 next-20231004]
> [cannot apply to lee-leds/for-leds-next lee-mfd/for-mfd-fixes]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Anastasio/dt-bindings-mfd-sie-cronos-cpld-Add-initial-DT-binding/20231003-073243
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
> patch link:    https://lore.kernel.org/r/2e9763cb4fa258fe11769a4ff1544d96c536a4a2.1696285339.git.sanastasio%40raptorengineering.com
> patch subject: [PATCH 3/3] mfd: sie-cronos-cpld: Add driver for SIE cronos CPLD
> config: i386-randconfig-063-20231005 (https://download.01.org/0day-ci/archive/20231005/202310050807.eDZkgFy5-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050807.eDZkgFy5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310050807.eDZkgFy5-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/mfd/sie-cronos-cpld.c:509:34: warning: 'cronos_cpld_dt_ids' defined but not used [-Wunused-const-variable=]
>      509 | static const struct of_device_id cronos_cpld_dt_ids[] = {
>          |                                  ^~~~~~~~~~~~~~~~~~
> 
> 
> vim +/cronos_cpld_dt_ids +509 drivers/mfd/sie-cronos-cpld.c
> 
>    508	
>  > 509	static const struct of_device_id cronos_cpld_dt_ids[] = {
>    510		{ .compatible = "sie,cronos-cpld", },
>    511		{ }
>    512	};
>    513	MODULE_DEVICE_TABLE(of, cronos_cpld_dt_ids);
>    514	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Removing from my queue until this is fixed.

-- 
Lee Jones [李琼斯]
