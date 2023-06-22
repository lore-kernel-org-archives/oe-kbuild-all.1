Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25891E536
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 19:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687461409; x=1718997409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rKhE+PldeIp+BLjAC8bFExZjW0dWo9wxPByxxOrqe2M=;
  b=DvuyB0UufWNk9NyM+F9hZ6G0vlSdOYe1drq54uFrep8obOWcISrGPXu/
   F7x4urNQg/k+i99KPDzD7p2eHDR1u0WGryM23e4S6+Zc+OcrnmQ0GqN1q
   NS3L1XSX463Xg8+cRajdU46fh9Jt4ndujIEFDRjT0QEMod7Q/ftpkRIgW
   O4ZVG6Yv+R7VF0Vsnaqgl5pKcaJh6JY6Pu0jKK2E38/OpKNSpHoOjCOdo
   9rgagNEjuNgWzSce3j6DbWhpCTe7dd0Dub9vkElNQ7/hmXMe6brgSmXK2
   BeR0jgl8JXPO2DTYD0HakmsBcb1ikPWhF9FZVVYMdW6EYxS8ssAzu6k9J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359450989"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="359450989"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 12:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="961695691"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="961695691"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2023 12:16:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCPnR-0007kh-2I;
	Thu, 22 Jun 2023 19:16:45 +0000
Date: Fri, 23 Jun 2023 03:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Li <hao3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 2/3]
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:33:29: error: redefinition
 of 'priv'
Message-ID: <202306230352.msGPyTQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   ef1fa9c790e4ab135c9beb006af1de69d2d48cd1
commit: 02fbcd87e1fe787a9d8a1cdd09ae5acebf3859b4 [2/3] Merge tag 'v5.15.113-dovetail1-rebase' into 5.15/dovetail-xenomai
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306230352.msGPyTQe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230352.msGPyTQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230352.msGPyTQe-lkp@intel.com/

Note: the intel-lts/5.15/dovetail-xenomai HEAD ef1fa9c790e4ab135c9beb006af1de69d2d48cd1 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c: In function 'dwmac4_core_init':
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:33:29: error: redefinition of 'priv'
      33 |         struct stmmac_priv *priv = netdev_priv(dev);
         |                             ^~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:27:29: note: previous definition of 'priv' with type 'struct stmmac_priv *'
      27 |         struct stmmac_priv *priv = netdev_priv(dev);
         |                             ^~~~
--
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c: In function 'dcn10_dmub_update_cursor_data':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:3396:14: error: implicit declaration of function 'dcn10_dmub_should_update_cursor_data'; did you mean 'dcn10_dmub_update_cursor_data'? [-Werror=implicit-function-declaration]
    3396 |         if (!dcn10_dmub_should_update_cursor_data(pipe_ctx, debug))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              dcn10_dmub_update_cursor_data
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:28:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:137:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     137 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:134:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     134 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:131:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     131 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c: In function 'amdgpu_pci_probe':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2087:9: error: 'base' undeclared (first use in this function)
    2087 |         base = pci_resource_start(pdev, 0);
         |         ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2087:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2088:9: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
    2088 |         size = pci_resource_len(pdev, 0);
         |         ^~~~
         |         ksize
>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2089:9: error: 'is_fw_fb' undeclared (first use in this function)
    2089 |         is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
         |         ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2089:20: error: implicit declaration of function 'amdgpu_is_fw_framebuffer' [-Werror=implicit-function-declaration]
    2089 |         is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c: In function 'amdgpu_runtime_pm_quirk':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:54:21: error: 'struct amdgpu_device' has no member named 'runpm'
      54 |                 adev->runpm = false;
         |                     ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c: In function 'amdgpu_driver_load_kms':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:193:25: error: 'struct amdgpu_device' has no member named 'is_fw_fb'
     193 |                 if (adev->is_fw_fb)
         |                         ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:194:29: error: 'struct amdgpu_device' has no member named 'runpm'
     194 |                         adev->runpm = false;
         |                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:198:25: error: 'struct amdgpu_device' has no member named 'runpm'
     198 |                 if (adev->runpm)
         |                         ^~
--
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_update_crtc_state':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8800:21: error: 'amdgpu_freesync_vid_mode' undeclared (first use in this function); did you mean 'is_freesync_video_mode'?
    8800 |                 if (amdgpu_freesync_vid_mode && dm_new_crtc_state->stream &&
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
         |                     is_freesync_video_mode
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8800:21: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link_enc_cfg.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:32:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:137:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     137 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:134:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     134 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:131:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     131 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/priv +33 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c

477286b53f5576 Alexandre TORGUE   2016-04-01  23  
8cad443eacf661 Florian Fainelli   2018-01-18  24  static void dwmac4_core_init(struct mac_device_info *hw,
8cad443eacf661 Florian Fainelli   2018-01-18  25  			     struct net_device *dev)
477286b53f5576 Alexandre TORGUE   2016-04-01  26  {
b0a513ba5b28be Wong Vee Khee      2022-07-14  27  	struct stmmac_priv *priv = netdev_priv(dev);
477286b53f5576 Alexandre TORGUE   2016-04-01  28  	void __iomem *ioaddr = hw->pcsr;
477286b53f5576 Alexandre TORGUE   2016-04-01  29  	u32 value = readl(ioaddr + GMAC_CONFIG);
5f5549b9982831 Marek Vasut        2023-05-07  30  	u32 clk_rate;
477286b53f5576 Alexandre TORGUE   2016-04-01  31  	
9bd72068aa5030 Song Yoong Siang   2022-01-10  32  	int mtu = dev->mtu;
9bd72068aa5030 Song Yoong Siang   2022-01-10 @33  	struct stmmac_priv *priv = netdev_priv(dev);
9bd72068aa5030 Song Yoong Siang   2022-01-10  34  #ifdef CONFIG_STMMAC_NETWORK_PROXY
9bd72068aa5030 Song Yoong Siang   2022-01-10  35  	if (!priv->networkproxy_exit) {
9bd72068aa5030 Song Yoong Siang   2022-01-10  36  #endif
477286b53f5576 Alexandre TORGUE   2016-04-01  37  		value |= GMAC_CORE_INIT;
477286b53f5576 Alexandre TORGUE   2016-04-01  38  
9bd72068aa5030 Song Yoong Siang   2022-01-10  39  		if (mtu > 1500)
9bd72068aa5030 Song Yoong Siang   2022-01-10  40  			value |= GMAC_CONFIG_2K;
9bd72068aa5030 Song Yoong Siang   2022-01-10  41  		if (mtu > 2000)
9bd72068aa5030 Song Yoong Siang   2022-01-10  42  			value |= GMAC_CONFIG_JE;
9bd72068aa5030 Song Yoong Siang   2022-01-10  43  
02e57b9d7c8ce9 Giuseppe CAVALLARO 2016-06-24  44  		if (hw->ps) {
02e57b9d7c8ce9 Giuseppe CAVALLARO 2016-06-24  45  			value |= GMAC_CONFIG_TE;
02e57b9d7c8ce9 Giuseppe CAVALLARO 2016-06-24  46  
ca84dfb9ab7084 LABBE Corentin     2017-05-24  47  			value &= hw->link.speed_mask;
ca84dfb9ab7084 LABBE Corentin     2017-05-24  48  			switch (hw->ps) {
ca84dfb9ab7084 LABBE Corentin     2017-05-24  49  			case SPEED_1000:
ca84dfb9ab7084 LABBE Corentin     2017-05-24  50  				value |= hw->link.speed1000;
ca84dfb9ab7084 LABBE Corentin     2017-05-24  51  				break;
ca84dfb9ab7084 LABBE Corentin     2017-05-24  52  			case SPEED_100:
ca84dfb9ab7084 LABBE Corentin     2017-05-24  53  				value |= hw->link.speed100;
ca84dfb9ab7084 LABBE Corentin     2017-05-24  54  				break;
ca84dfb9ab7084 LABBE Corentin     2017-05-24  55  			case SPEED_10:
ca84dfb9ab7084 LABBE Corentin     2017-05-24  56  				value |= hw->link.speed10;
ca84dfb9ab7084 LABBE Corentin     2017-05-24  57  				break;
02e57b9d7c8ce9 Giuseppe CAVALLARO 2016-06-24  58  			}
02e57b9d7c8ce9 Giuseppe CAVALLARO 2016-06-24  59  		}
02e57b9d7c8ce9 Giuseppe CAVALLARO 2016-06-24  60  
477286b53f5576 Alexandre TORGUE   2016-04-01  61  		writel(value, ioaddr + GMAC_CONFIG);
9bd72068aa5030 Song Yoong Siang   2022-01-10  62  #ifdef CONFIG_STMMAC_NETWORK_PROXY
9bd72068aa5030 Song Yoong Siang   2022-01-10  63  	}
9bd72068aa5030 Song Yoong Siang   2022-01-10  64  #endif
477286b53f5576 Alexandre TORGUE   2016-04-01  65  
5f5549b9982831 Marek Vasut        2023-05-07  66  	/* Configure LPI 1us counter to number of CSR clock ticks in 1us - 1 */
5f5549b9982831 Marek Vasut        2023-05-07  67  	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
5f5549b9982831 Marek Vasut        2023-05-07  68  	writel((clk_rate / 1000000) - 1, ioaddr + GMAC4_MAC_ONEUS_TIC_COUNTER);
5f5549b9982831 Marek Vasut        2023-05-07  69  
e879b7ab3739d8 Niklas Cassel      2018-02-09  70  	/* Enable GMAC interrupts */
e879b7ab3739d8 Niklas Cassel      2018-02-09  71  	value = GMAC_INT_DEFAULT_ENABLE;
1029117127540f Niklas Cassel      2018-02-09  72  
3fe5cadbd3494b Giuseppe CAVALLARO 2016-06-24  73  	if (hw->pcs)
3fe5cadbd3494b Giuseppe CAVALLARO 2016-06-24  74  		value |= GMAC_PCS_IRQ_DEFAULT;
3fe5cadbd3494b Giuseppe CAVALLARO 2016-06-24  75  
5a5586112b9295 Ong Boon Leong     2021-03-24  76  	/* Enable FPE interrupt */
5a5586112b9295 Ong Boon Leong     2021-03-24  77  	if ((GMAC_HW_FEAT_FPESEL & readl(ioaddr + GMAC_HW_FEATURE3)) >> 26)
5a5586112b9295 Ong Boon Leong     2021-03-24  78  		value |= GMAC_INT_FPE_EN;
5a5586112b9295 Ong Boon Leong     2021-03-24  79  
3fe5cadbd3494b Giuseppe CAVALLARO 2016-06-24  80  	writel(value, ioaddr + GMAC_INT_EN);
1624f536c905dc Wong Vee Khee      2022-07-14  81  
1624f536c905dc Wong Vee Khee      2022-07-14  82  	if (GMAC_INT_DEFAULT_ENABLE & GMAC_INT_TSIE)
1624f536c905dc Wong Vee Khee      2022-07-14  83  		init_waitqueue_head(&priv->tstamp_busy_wait);
477286b53f5576 Alexandre TORGUE   2016-04-01  84  }
477286b53f5576 Alexandre TORGUE   2016-04-01  85  

:::::: The code at line 33 was first introduced by commit
:::::: 9bd72068aa5030ced0f4b76657a2e59911e5dc73 net: stmmac: add network proxy support

:::::: TO: Song Yoong Siang <yoong.siang.song@intel.com>
:::::: CC: Zhou Furong <furong.zhou@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
