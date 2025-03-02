Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2407815C158
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740901184; cv=none; b=qBU7mQhXZkx0B55YAYyQSp2I7M2W7DjDaVTn+kY0mUiR5ybe5JI6kham9E7JlaN/l82/0LrsX1PyC0HBhLbBYJah6HuIe3LzYlL2ypD+YTCXahFADK3hFp9q/zcelJKV5isyej7idIZT0c2JU8axBHfDHEDfLV9zp6EwlqyD0kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740901184; c=relaxed/simple;
	bh=ijo9OIoH6dzlMuCZ+eQsjv98zX5Ty83nYhmkCbZ5pDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYaEQ+puWQWR8nfAHXnRqeB3o6180YOH6C7FfSXS8Lvn3tFIDwdGAHYiTZurRUwelk5NiDJ17ulbXsaYo6jrnY+yXB8eLAjNnnn+1+bUEfVL/tiNOGteO7gBApVxQcDsf1DgmtVoQ1XjDPOJ/Eokp3oHKwCi4vWBQfNcrPQ4kYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmjYNhkH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmjYNhkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740901183; x=1772437183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ijo9OIoH6dzlMuCZ+eQsjv98zX5Ty83nYhmkCbZ5pDk=;
  b=lmjYNhkHXRWiJ5v9QKt2BGFJkMEB88aX1iNJIXbfQDHCFsv9SXDDnjF1
   E026RwPvhpjmjvexuz0tMIV3/Ds8LihbTG994aMNCLliYLolGdrS0dYQg
   DSg5RP2g9eU9rLmHDnT8U6eLNsNQpSDLhquHMoxx+q2cOblJrY/w2myPt
   er466cvRcMUZgQbcF+3AUVs5AoTA2HvcNokNmDRV7uKygt62FxIUf8co2
   QiGB9Xj9619dKOBRWBrpwin3C2LZ8bMDWJEd73XhxHljZVqrwxTOEjrit
   kiNejD3tPnnyp6C9bXiia50JPrLdwMlF3Ccg8NU3KOK6aeA4+7kvGX9kv
   g==;
X-CSE-ConnectionGUID: HlSSYv0PTF6LHxJn1zXsZQ==
X-CSE-MsgGUID: Kmlv29dwT+OkjaOY4TOjMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="45568126"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="45568126"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 23:39:42 -0800
X-CSE-ConnectionGUID: 8UGSvqJpTKy8oOIY0vPdDQ==
X-CSE-MsgGUID: gHksGNsXTWyNV1i/eE661g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="117473383"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2025 23:39:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1todvA-000HAU-1e;
	Sun, 02 Mar 2025 07:39:32 +0000
Date: Sun, 2 Mar 2025 15:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 18/18] bitops: Add parity() macro for automatic
 type-based selection
Message-ID: <202503021526.S9ZVzkRV-lkp@intel.com>
References: <20250301142409.2513835-19-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301142409.2513835-19-visitorckw@gmail.com>

Hi Kuan-Wei,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250228]
[cannot apply to akpm-mm/mm-nonmm-unstable dtor-input/next dtor-input/for-linus tty/tty-testing tty/tty-next tty/tty-linus wireless-next/main wireless/main mtd/mtd/next mtd/mtd/fixes linus/master v6.14-rc4 v6.14-rc3 v6.14-rc2 v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuan-Wei-Chiu/lib-parity-Add-__builtin_parity-fallback-implementations/20250301-222957
base:   next-20250228
patch link:    https://lore.kernel.org/r/20250301142409.2513835-19-visitorckw%40gmail.com
patch subject: [PATCH v2 18/18] bitops: Add parity() macro for automatic type-based selection
config: powerpc64-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021526.S9ZVzkRV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021526.S9ZVzkRV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021526.S9ZVzkRV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c:7:
>> include/linux/bitops.h:343:2: error: expected identifier or '(' before '{' token
     343 | ({                                      \
         |  ^
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c:173:12: note: in expansion of macro 'parity'
     173 | static u32 parity(u32 sample)
         |            ^~~~~~
--
   In file included from dw-hdmi-ahb-audio.c:7:
>> include/linux/bitops.h:343:2: error: expected identifier or '(' before '{' token
     343 | ({                                      \
         |  ^
   dw-hdmi-ahb-audio.c:173:12: note: in expansion of macro 'parity'
     173 | static u32 parity(u32 sample)
         |            ^~~~~~


vim +343 include/linux/bitops.h

   341	
   342	#define parity(val)			\
 > 343	({					\
   344		int __ret;			\
   345		switch (BITS_PER_TYPE(val)) {	\
   346		case 64:			\
   347			__ret = parity64(val);	\
   348			break;			\
   349		case 32:			\
   350			__ret = parity32(val);	\
   351			break;			\
   352		case 16:			\
   353			__ret = parity16(val);	\
   354			break;			\
   355		case 8:				\
   356			__ret = parity8(val);	\
   357			break;			\
   358		default:			\
   359			BUILD_BUG();		\
   360		}				\
   361		__ret;				\
   362	})
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
