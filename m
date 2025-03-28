Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C81D5CD1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743177804; cv=none; b=ogRCPl20rq3rSCc/AkwXaBG1yR2jZizMxrxOn9FkPj9cXTMPzE8mcVOA7pDF1svqw+9hnhxDvOes5rtQpS14v7balgVwe7zFVxKkm5TAK3ukfl2RDPDREDerZ44366bBvpZsQ9S5lofVHmBwrl5tFA/4Kre+pY3Dj+DGBXcDTFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743177804; c=relaxed/simple;
	bh=Au7izswjCBcniyBS2Odx2NF8U/pj+epNYXh6JS3o8xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pDfHUhON/bx91rzMMAAqbo5XvJStBHw8u0T9BQUn4fFew/m0VhaWeZnPpsmXdo1Yden3haaQ0iCGl0srIUjtVKEqFaGLddsIdCNiMaJqilvstJNRQMeOVJNNNBS24wbhbciPN4dyUK/4Ct5+NL0nqNBLs/mo6BPDNeq/t161fiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KH0xFMfG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KH0xFMfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743177802; x=1774713802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Au7izswjCBcniyBS2Odx2NF8U/pj+epNYXh6JS3o8xw=;
  b=KH0xFMfGu1IOOayyd8Vv1d6t2MVePaWjTZ2aIJdIs/l+deAUZ/MTNcx6
   WlZbTY9UPfMz5VGYvy5D2pml9Kg9J25eK/C4+5kwtT1f94ljai+fa4qKS
   zn5IANd9hrxPa76Y05KS8yBqwWwUBQ7yfnbzZCc3Q7o0xLKnY1loYWykp
   rfirPtyy5Yx6a9FCaryZgiB5XAf4Bn62r016+OO1lmaESq4L48b9OnWth
   /FbBAL41d/i05hErhys35sYP9H6EOjGziZeaM8xo1Q06SjstGa3TAZvWC
   NsVGVWilgI8iuO907H4zDaKZQnq8H8McH5EgdZE5F+bK1bAKOyuTLm+Xl
   g==;
X-CSE-ConnectionGUID: Cif2kjJpQ9ur7GXIrsUu+w==
X-CSE-MsgGUID: X+z0hPBTRuuZgrfjtwC4Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44725160"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44725160"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 09:03:18 -0700
X-CSE-ConnectionGUID: C/Iy3ad0RVqSrixqz+TlBA==
X-CSE-MsgGUID: fLaCYdSHT1KOysbscvEmBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125377444"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2025 09:03:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyCAt-0007Yk-1r;
	Fri, 28 Mar 2025 16:03:15 +0000
Date: Sat, 29 Mar 2025 00:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 501/501]
 ERROR: modpost: "mtk_vcodec_dec_optee_private_init"
 [drivers/media/platform/mediatek/vcodec/decoder/mtk-vcodec-dec.ko]
 undefined!
Message-ID: <202503282306.daWgYBI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   05387f6649b8b2e90387b0f30e788b96413e54d0
commit: 4f1282c47515ad05bd9255065569db42cf5ecf0b [501/501] FROMLIST: media: mediatek: vcodec: support tee decoder
config: arm64-randconfig-004-20250327 (https://download.01.org/0day-ci/archive/20250328/202503282306.daWgYBI0-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503282306.daWgYBI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503282306.daWgYBI0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-total-media-in-hand-02.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-total-media-in-hand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-trekstor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tt-1500.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-twinhan1027.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-vega-s9x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-m1f.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-s350.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-tv-pvr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videostrong-kii-pro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-wetek-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-wetek-play2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-winfast.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-x96max.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-xbox-360.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-xbox-dvd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-zx-irdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/videobuf2/videobuf2-dvb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/marvell/mmp_camera.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/marvell/mcam-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos-fimc-is.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos4-is-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/ttpci/budget-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/dvb-usb/dvb-usb-dibusb-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/dvb-usb/dvb-usb-dibusb-mc-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/go7007/go7007.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/power/reset/piix4-poweroff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/twl4030_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/ts4800_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/meson/meson_sm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/coreboot_table.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/framebuffer-coreboot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole-coreboot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/cbmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/vpd-sysfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome/cros_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/arm_cspmu_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_brcm_nvram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mm-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mq-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mn-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mp-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_aec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_netx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/core/dev_addr_lists_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/stp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack_netlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack_broadcast.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nft_fib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nft_chain_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_rr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_wrr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_wlc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_fo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblcr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_dh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_nq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_defrag_ipv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_defrag_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_reject_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/xfrm6_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ip6_udp_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/nf_conntrack_bridge.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sctp/sctp_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/tipc/diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/smc/smc_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci.o
ERROR: modpost: "mtk_vcodec_dec_get_shm_buffer_va" [drivers/media/platform/mediatek/vcodec/decoder/mtk-vcodec-dec.ko] undefined!
>> ERROR: modpost: "mtk_vcodec_dec_optee_private_init" [drivers/media/platform/mediatek/vcodec/decoder/mtk-vcodec-dec.ko] undefined!
>> ERROR: modpost: "mtk_vcodec_dec_optee_close" [drivers/media/platform/mediatek/vcodec/decoder/mtk-vcodec-dec.ko] undefined!
ERROR: modpost: "mtk_vcodec_dec_optee_set_msg_info" [drivers/media/platform/mediatek/vcodec/decoder/mtk-vcodec-dec.ko] undefined!
ERROR: modpost: "mtk_vcodec_dec_optee_set_data_info" [drivers/media/platform/mediatek/vcodec/decoder/mtk-vcodec-dec.ko] undefined!
ERROR: modpost: "mtk_vcodec_dec_optee_invokd_cmd" [drivers/media/platform/mediatek/vcodec/decoder/mtk-vcodec-dec.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
