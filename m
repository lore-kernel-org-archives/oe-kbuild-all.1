Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478318A929
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 16:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418863; cv=none; b=IeRY2AX4AKkL+VbQbe1JAHOKhmmzwL1ZqVrk6wLtEq21WP2OWwrG9rE2E1sYUISHyFi2TP3XWZPGAM1KG71AW+84iIygIkxUu9imduME7ytOA7kwg2ajluKCiL+tWlEz6seO859DLMo6LUO/MebKjrY7e4x17IrOZi1KQuztaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418863; c=relaxed/simple;
	bh=LsemXSMrG0cG28ju3Gs9TGdTHt5METFW5SyoGa42H70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSPMmZ527uWj9VZj1VrAVze0W/wKl/2QgqcEaAIiiIO66r+tJA6PhubXcNK7cZkdf/MzVbpm8rYrLHSdmiRvBrRJfLoOhWM2HsSl8K92JGalJOpoA9q4JiAyAjJ7F84wbykooFJZmFmxmRe+2jkcP9OkX2qZBp0+CB1INFSQPLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRkJ2pFV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRkJ2pFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719418862; x=1750954862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LsemXSMrG0cG28ju3Gs9TGdTHt5METFW5SyoGa42H70=;
  b=RRkJ2pFVLw4bcavcrSWe+2udKUtlSyscEGs8p2n2tLYEV+G51HwbYB6e
   B8PW3jCaAORXWCqSWlZRdEriShj6PaZSEKfvLIMiiiLfzWaUykAXerOI/
   E17poGff4eNgiFTV7H93sBNrADDn71Cvr+bbvpL0AKemugKCtdiYWcaVA
   +/3MBPwDfN4dzexz+ZAnJVplndoDd6F1219tdekA1IgJ1eqQHhcAptYlW
   c4bRukQFooFBgP7Y+cKELB99+W0TjnHy7clUBH0uEXYKQI2NUBlFUP9tK
   L7fgFCwLegPAQ0WW2dfJIsB9WMs2BDjD8cmoEum2aKLwAJt1KhfmqkshI
   g==;
X-CSE-ConnectionGUID: Elnz8vGsTDSgI5lOJA26vQ==
X-CSE-MsgGUID: ugyfIpRkQWeF8lnXKjhKkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19391247"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="19391247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 09:21:02 -0700
X-CSE-ConnectionGUID: nu/CRSJUTOStpLIf32WBQA==
X-CSE-MsgGUID: IICu3xKWQhazFPHuzNdC2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="44162877"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jun 2024 09:20:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMVOD-000FNe-1M;
	Wed, 26 Jun 2024 16:20:57 +0000
Date: Thu, 27 Jun 2024 00:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jay Vosburgh <j.vosburgh@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Hangbin Liu <liuhangbin@gmail.com>
Subject: Re: [PATCHv2 net-next] bonding: 3ad: send ifinfo notify when mux
 state changed
Message-ID: <202406270002.Pr7BwyW0-lkp@intel.com>
References: <20240625070057.2004129-1-liuhangbin@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625070057.2004129-1-liuhangbin@gmail.com>

Hi Hangbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Hangbin-Liu/bonding-3ad-send-ifinfo-notify-when-mux-state-changed/20240626-005323
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240625070057.2004129-1-liuhangbin%40gmail.com
patch subject: [PATCHv2 net-next] bonding: 3ad: send ifinfo notify when mux state changed
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240627/202406270002.Pr7BwyW0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270002.Pr7BwyW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270002.Pr7BwyW0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/grace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libchacha.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_accel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_DAC1064.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_Ti3026.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/macmodes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/udl/udl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-dj.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_socket.o
>> ERROR: modpost: "rtmsg_ifinfo" [drivers/net/bonding/bonding.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
