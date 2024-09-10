Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C98F17BEBD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 19:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995824; cv=none; b=i9h+xC8/syBtfzb2cFAQSXcbFzbA1TNW9dBYmy1tdGK2zwGY0hyJVok6PjgWZ0bD9ez3WDCHzZ5ITd4gZ4ZDXwRIljhaI0iG2NHRnzK2iO703YxWGGK2qoLIrgO40TAygsM60OamteF/AIG2qhOCe8Q3BkJEYY4wX8Dgwixthr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995824; c=relaxed/simple;
	bh=erHSHhnBR7lbXGEvU+zh+camUYNAnlDgJycnIt1Nwbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mE4t44gAjtsSgeZoQtA13mPj6jzNkBIh6c8MsqJcpyNbY3Ap6WDqxsCefq5TJkrFp7nbynNgQONSIWsLHMZWwumhzqASU/sgAL3ZNqu0/+1YtBNLIgg1J3Y6mkWuMyDuGN/nPmUvHgQ3Bdt7hcGWEeWkZprkCdGbK2xY+OG702U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+AWppes; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+AWppes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725995822; x=1757531822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=erHSHhnBR7lbXGEvU+zh+camUYNAnlDgJycnIt1Nwbo=;
  b=N+AWppesqt4SmXcnyahRp5yfxuHDuca3vEmSSJSHPiik4qHr/yxntQrA
   deULzws8rLIf0cWxiJhMBIE5o7tLA3ReLgcToD184UbOwW+EiwIBUu0mL
   j0SI1D6wySQ3UdVREparsnaBq0ftrL8w2bKlN5dxkoo+FN1m1aUUpKlFt
   Pib/JUSyIM7HSGDB+DEvJGLC/LwF2ccAzdG6DaCTOuABZIPOy31yRdSHl
   CLmwxqr0Q9RLBmoP/h6Fj0+J9F1BA721N2C6CfIzcw9fsVNg7jdFXTBRa
   cZOaPVwa3xyNQZrVMs3c+qQfO6+vXF/atPmbAjgx/uGGj0yHVyaWFWzLC
   Q==;
X-CSE-ConnectionGUID: IezSacfxRPWoTKxiCtR0gw==
X-CSE-MsgGUID: VE3H/SpLSjOs9alXkEVolQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50180655"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="50180655"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 12:17:02 -0700
X-CSE-ConnectionGUID: +K4+271wSFWZ3lG9+Jo9aA==
X-CSE-MsgGUID: olmpDSLITae+3vNuOCGhDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="71892112"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2024 12:17:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so6ME-0002WI-26;
	Tue, 10 Sep 2024 19:16:58 +0000
Date: Wed, 11 Sep 2024 03:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 13915/15115]
 drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:871:15: warning: variable
 'ui32HWPerfPacketsSent' set but not used
Message-ID: <202409110353.ljvfmcEA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   d96e302a66f36502668b61226367cebb93775bbd
commit: 7b4b976d249b9ae5dbb9fa954bdcb09c4dde6dfd [13915/15115] CHROMIUM: drm/img-rogue: Add 1.17 IMG PowerVR Rogue driver
config: arm64-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240911/202409110353.ljvfmcEA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110353.ljvfmcEA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110353.ljvfmcEA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:871:15: warning: variable 'ui32HWPerfPacketsSent' set but not used [-Wunused-but-set-variable]
           IMG_UINT32                      ui32HWPerfPacketsSent = 0;
                                           ^
>> drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:869:15: warning: variable 'ui32TlPackets' set but not used [-Wunused-but-set-variable]
           IMG_UINT32                      ui32TlPackets = 0;
                                           ^
>> drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:870:15: warning: variable 'ui32HWPerfPackets' set but not used [-Wunused-but-set-variable]
           IMG_UINT32                      ui32HWPerfPackets = 0;
                                           ^
   3 warnings generated.
--
>> drivers/gpu/drm/img-rogue/1.17/rgxhwperf_common.c:3410:15: warning: variable 'ui32TlPackets' set but not used [-Wunused-but-set-variable]
           IMG_UINT32                      ui32TlPackets = 0;
                                           ^
   1 warning generated.
--
>> drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:869:15: warning: variable 'ui32TlPackets' set but not used [-Wunused-but-set-variable]
           IMG_UINT32                      ui32TlPackets = 0;
                                           ^
>> drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:870:15: warning: variable 'ui32HWPerfPackets' set but not used [-Wunused-but-set-variable]
           IMG_UINT32                      ui32HWPerfPackets = 0;
                                           ^
>> drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:871:15: warning: variable 'ui32HWPerfPacketsSent' set but not used [-Wunused-but-set-variable]
           IMG_UINT32                      ui32HWPerfPacketsSent = 0;
                                           ^
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +/ui32HWPerfPacketsSent +871 drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c

   864	
   865	
   866	static void _GpuTraceProcessPackets(PVRSRV_RGXDEV_INFO *psDevInfo,
   867			void *pBuffer, IMG_UINT32 ui32ReadLen)
   868	{
 > 869		IMG_UINT32			ui32TlPackets = 0;
 > 870		IMG_UINT32			ui32HWPerfPackets = 0;
 > 871		IMG_UINT32			ui32HWPerfPacketsSent = 0;
   872		void				*pBufferEnd;
   873		PVRSRVTL_PPACKETHDR psHDRptr;
   874		PVRSRVTL_PACKETTYPE ui16TlType;
   875	
   876		PVR_DPF_ENTERED;
   877	
   878		PVR_ASSERT(psDevInfo);
   879		PVR_ASSERT(pBuffer);
   880		PVR_ASSERT(ui32ReadLen);
   881	
   882		/* Process the TL Packets
   883		 */
   884		pBufferEnd = IMG_OFFSET_ADDR(pBuffer, ui32ReadLen);
   885		psHDRptr = GET_PACKET_HDR(pBuffer);
   886		while ( psHDRptr < (PVRSRVTL_PPACKETHDR)pBufferEnd )
   887		{
   888			ui16TlType = GET_PACKET_TYPE(psHDRptr);
   889			if (ui16TlType == PVRSRVTL_PACKETTYPE_DATA)
   890			{
   891				IMG_UINT16 ui16DataLen = GET_PACKET_DATA_LEN(psHDRptr);
   892				if (0 == ui16DataLen)
   893				{
   894					PVR_DPF((PVR_DBG_ERROR, "_GpuTraceProcessPackets: ZERO Data in TL data packet: %p", psHDRptr));
   895				}
   896				else
   897				{
   898					RGX_HWPERF_V2_PACKET_HDR* psHWPerfPkt;
   899					RGX_HWPERF_V2_PACKET_HDR* psHWPerfEnd;
   900	
   901					/* Check for lost hwperf data packets */
   902					psHWPerfEnd = RGX_HWPERF_GET_PACKET(GET_PACKET_DATA_PTR(psHDRptr)+ui16DataLen);
   903					psHWPerfPkt = RGX_HWPERF_GET_PACKET(GET_PACKET_DATA_PTR(psHDRptr));
   904					do
   905					{
   906						if (ValidAndEmitFTraceEvent(psDevInfo, psHWPerfPkt))
   907						{
   908							ui32HWPerfPacketsSent++;
   909						}
   910						ui32HWPerfPackets++;
   911						psHWPerfPkt = RGX_HWPERF_GET_NEXT_PACKET(psHWPerfPkt);
   912					}
   913					while (psHWPerfPkt < psHWPerfEnd);
   914				}
   915			}
   916			else if (ui16TlType == PVRSRVTL_PACKETTYPE_MOST_RECENT_WRITE_FAILED)
   917			{
   918				PVR_DPF((PVR_DBG_MESSAGE, "_GpuTraceProcessPackets: Indication that the transport buffer was full"));
   919			}
   920			else
   921			{
   922				/* else Ignore padding packet type and others */
   923				PVR_DPF((PVR_DBG_MESSAGE, "_GpuTraceProcessPackets: Ignoring TL packet, type %d", ui16TlType ));
   924			}
   925	
   926			psHDRptr = GET_NEXT_PACKET_ADDR(psHDRptr);
   927			ui32TlPackets++;
   928		}
   929	
   930		PVR_DPF((PVR_DBG_VERBOSE, "_GpuTraceProcessPackets: TL "
   931				"Packets processed %03d, HWPerf packets %03d, sent %03d",
   932				ui32TlPackets, ui32HWPerfPackets, ui32HWPerfPacketsSent));
   933	
   934		PVR_DPF_RETURN;
   935	}
   936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
