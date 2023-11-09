Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C7D268
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 05:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="PFwD2XAm"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-357ccaf982eso1914065ab.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Nov 2023 21:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1699508245; x=1700113045; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uqCVKURZkdnc8Sc+q8t4D7aQ1PHCBVFIg7Q1EQgXMic=;
        b=PFwD2XAmjmmY3Ka8JZfWk11bruWLnD4kQS7ORoU+6Pz7OCgBOvjylAoLfaCmUCk3Vl
         Ph2rTiFZX1DoaZrbvibcadU/VIXMrXSvcWqS4LP/FrUBs+InekUV6HXaIeLCWI8XrxD/
         wGCEXCJqK55DQ+S1ZkmHX9VpyHMvWRcS4dToH6knba8H7keh8q0cDTb1iwXJCd4PQAUB
         DD4u4Kd77dKGNQM9Pz5xJ883dvA6H2zkTjEYdzsMDVgYF9XVIBLtSnDqRNK/0noSbZlX
         1pwb6ATtROYJ1NyUKteA/e5eFNm+XBgLmU2ulMs4Z1QRd3qA2c6IE/Gz05zHYNCaH4RV
         DQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699508245; x=1700113045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqCVKURZkdnc8Sc+q8t4D7aQ1PHCBVFIg7Q1EQgXMic=;
        b=xKpcZAdBo7hrcUPIyGUFwodwhN/psNiKj3MpiudW/c2NiDpJmKdd0b7YSG7Rq4JcNg
         P3FwD0/WZd49rZEuasmuHiQnyVXVCiZMFfpSSSPNzAMdPzlVYP5k+bKVDoBaMQBnxykW
         O4RQlGzh/H57HvQBguaU4xyAwiO2hsKz+urx0GsEvoWwrrxNWvOshlIwS6HYkJmXQIkG
         +4XyHaxD8wfhbXRFqxrfXSIv2F5IJrHikrrJl5YwdU6U1FfbmPgVgShfVkV5mDYTAMV+
         9dxnPMMIdTzbyceFBDRrxlUq3Vhy3KckWbHmsSCf6WcvsPDzjWTw1ZEjMbnSh1z8dy50
         XNcw==
X-Gm-Message-State: AOJu0YyXjZZokaOYnPcEejGMi02AyCb1u+31hVYijpg7OWFh2UdDEQ9V
	R8jgHstlMHlQf0jnyzsZ8Kvarg==
X-Google-Smtp-Source: AGHT+IGP2r3bL9pu9iBmV91XbZ//ufgsIl+ac7AYpSyfa7ARxO8Ui2ecns7UT/BAyxHNTDbx6AaEyA==
X-Received: by 2002:a92:cc82:0:b0:359:97f3:e7e7 with SMTP id x2-20020a92cc82000000b0035997f3e7e7mr3059994ilo.26.1699508244822;
        Wed, 08 Nov 2023 21:37:24 -0800 (PST)
Received: from sunil-laptop ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id a25-20020a634d19000000b005894450b404sm3837985pgb.63.2023.11.08.21.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 21:37:24 -0800 (PST)
Date: Thu, 9 Nov 2023 11:07:18 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, ajones@ventanamicro.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1190:25: warning:
 '%s' directive argument is null
Message-ID: <ZUxwDgFhC/gAidXU@sunil-laptop>
References: <ZUwYejD6z1Kxa8ky@sunil-laptop>
 <mhng-9c8eb5de-4aab-467a-b09f-ff6707b74738@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-9c8eb5de-4aab-467a-b09f-ff6707b74738@palmer-ri-x1c9>

On Wed, Nov 08, 2023 at 05:21:34PM -0800, Palmer Dabbelt wrote:
> On Wed, 08 Nov 2023 15:23:38 PST (-0800), sunilvl@ventanamicro.com wrote:
> > On Sat, Nov 04, 2023 at 06:24:22AM +0800, kernel test robot wrote:
> > > Hi Sunil,
> > > 
> > > FYI, the error/warning still remains.
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   e392ea4d4d00880bf94550151b1ace4f88a4b17a
> > > commit: a91a9ffbd3a55a0ae1bb75e2b6e85b2a03f64e8f RISC-V: Add support to build the ACPI core
> > > date:   5 months ago
> > > config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311040602.sCjU3UXr-lkp@intel.com/config)
> > > compiler: riscv64-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040602.sCjU3UXr-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202311040602.sCjU3UXr-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > >    In file included from drivers/net/wireless/intel/iwlwifi/fw/acpi.c:9:
> > >    drivers/net/wireless/intel/iwlwifi/fw/acpi.c: In function 'iwl_acpi_is_ppag_approved':
> > > >> drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1190:25: warning: '%s' directive argument is null [-Wformat-overflow=]
> > >     1190 |                         "System vendor '%s' is not in the approved list, disabling PPAG.\n",
> > >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    drivers/net/wireless/intel/iwlwifi/iwl-debug.h:91:56: note: in definition of macro '__IWL_DEBUG_DEV'
> > >       91 |                 __iwl_dbg(dev, level, limit, __func__, fmt, ##args);    \
> > >          |                                                        ^~~
> > >    drivers/net/wireless/intel/iwlwifi/iwl-debug.h:209:41: note: in expansion of macro 'IWL_DEBUG'
> > >      209 | #define IWL_DEBUG_RADIO(p, f, a...)     IWL_DEBUG(p, IWL_DL_RADIO, f, ## a)
> > >          |                                         ^~~~~~~~~
> > >    drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1189:17: note: in expansion of macro 'IWL_DEBUG_RADIO'
> > >     1189 |                 IWL_DEBUG_RADIO(fwrt,
> > >          |                 ^~~~~~~~~~~~~~~
> > >    drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1190:41: note: format string is defined here
> > >     1190 |                         "System vendor '%s' is not in the approved list, disabling PPAG.\n",
> > >          |                                         ^~
> > > 
> > > 
> > > vim +1190 drivers/net/wireless/intel/iwlwifi/fw/acpi.c
> > > 
> > > e8e10a37c51c08 Matt Chen 2022-03-04  1187
> > > e8e10a37c51c08 Matt Chen 2022-03-04  1188  	if (!dmi_check_system(dmi_ppag_approved_list)) {
> > > e8e10a37c51c08 Matt Chen 2022-03-04  1189  		IWL_DEBUG_RADIO(fwrt,
> > > e8e10a37c51c08 Matt Chen 2022-03-04 @1190  			"System vendor '%s' is not in the approved list, disabling PPAG.\n",
> > > 
> > Hi,
> > 
> > This should be fixed once SMBIOS is enabled in RISC-V. So, can this
> > warning be ignored until SMBIOS support is merged for RISC-V?
> 
> Maybe we should just have something like this?
> 
> diff --git a/drivers/net/wireless/intel/iwlwifi/Kconfig b/drivers/net/wireless/intel/iwlwifi/Kconfig
> index 20971304fdef..cbcd1dcced4d 100644
> --- a/drivers/net/wireless/intel/iwlwifi/Kconfig
> +++ b/drivers/net/wireless/intel/iwlwifi/Kconfig
> @@ -1,7 +1,7 @@
> # SPDX-License-Identifier: GPL-2.0-only
> config IWLWIFI
> 	tristate "Intel Wireless WiFi Next Gen AGN - Wireless-N/Advanced-N/Ultimate-N (iwlwifi) "
> -	depends on PCI && HAS_IOMEM && CFG80211
> +	depends on PCI && HAS_IOMEM && CFG80211 && DMI
> 	depends on IWLMEI || !IWLMEI
> 	select FW_LOADER
> 	help
> 
Sure Palmer. This works to resolve the warning but I was bit hesitant to
do this because it appeared only part of the driver code depend on
ACPI/DMI. So, I was not sure adding a dependency would disable the
driver on non-ACPI platforms. Anyway, let me send the patch and see
whether driver maintainer would be okay.

Thanks!
Sunil
