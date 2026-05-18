Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2C9405F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 00:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779064632; cv=none; b=dIItC3Dw/W78ScbTMVu+cSL31109jXB9YUdLDmCZ0JzmVQjHkEl6sBwcB+3wAdgWkL18p/Za+SKsn6J3rFISCjELfo/RNmCEYTYN2hAEqHxZelHZ4DZXYcyPPQSOcOeHQcV5CEOI9C/pgdFmpryEexXdLlAyBYPkQtKZt0Kq29M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779064632; c=relaxed/simple;
	bh=njCHD/f2c63V8LMp47w0Fa8+2DaLQ7hDfr8h1FESJmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8SY31q/G0ljIHS1otJRn6zEiYUcW3ug/ghSaV4QEykrjgstjF20TYE5xt4m4nKrvdJ3yg3D7OLKC6kD26KsxYluvjrpidvXW3RRmFGwBD1DEbuEczmECoxZJdESS2ANdYvNavjP5tNIF7TCs0C+rT6AA3krU3BKrlmmhzQU7Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+uPwWfK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+uPwWfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779064631; x=1810600631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=njCHD/f2c63V8LMp47w0Fa8+2DaLQ7hDfr8h1FESJmM=;
  b=R+uPwWfKe1/YmoOyR/FINnzIVCOT+X82o0yR4NwgecfDSE7MNA3p+heq
   hvZ5G/1j3bFCX6xv1E0ITjI7JjuaNWKVB6JH7/JYmHVRbQzdQvBCzehWE
   OVnqnbVzuQgMMpJpVTJVKdg1L7wvV/1NaoLVXJiOMCSMh5epFhJb/kI5b
   EWfmFuF6DvQlPJ3ECZeKo+h44AG+q9arttBs+eVm6KtAd59H9h9/XoZsN
   Gi/CjYVZwBwOnNYyhxsT9q6LQC12fiwgGGKhSzHaOfFNMJ0fV1cuHryLG
   lPqkTfiCGQKLNt1+BUIEbrpr89KyVhTjb+FO7Ow0rQoUda7za3NULo9QM
   Q==;
X-CSE-ConnectionGUID: WfdAeV+rRlmWjAG1rWfUmg==
X-CSE-MsgGUID: GJNIaC0lR6mX+q3v8zc4fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79962004"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79962004"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 17:37:10 -0700
X-CSE-ConnectionGUID: gNBWH3h/Tw2aZI7jq7rx2w==
X-CSE-MsgGUID: qE6UX6E7QzqQs1xmFqH5XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="243569814"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 May 2026 17:37:06 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOlyg-0000000027q-21fG;
	Mon, 18 May 2026 00:37:02 +0000
Date: Mon, 18 May 2026 08:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: vishnu.saini@oss.qualcomm.com, Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
	Ravi Agola <raviagol@qti.qualcomm.com>,
	Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: lt9611uxc: support displays with up to 4
 EDID blocks
Message-ID: <202605180800.luZQCJZK-lkp@intel.com>
References: <20260517-lt9611usc_edid34_misc_next-v1-1-5e2fd8c6399b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-lt9611usc_edid34_misc_next-v1-1-5e2fd8c6399b@oss.qualcomm.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4c26e162947f91aa78ba57dd4fddd38fc80e7d60]

url:    https://github.com/intel-lab-lkp/linux/commits/vishnu-saini-oss-qualcomm-com/drm-bridge-lt9611uxc-support-displays-with-up-to-4-EDID-blocks/20260518-021632
base:   4c26e162947f91aa78ba57dd4fddd38fc80e7d60
patch link:    https://lore.kernel.org/r/20260517-lt9611usc_edid34_misc_next-v1-1-5e2fd8c6399b%40oss.qualcomm.com
patch subject: [PATCH] drm/bridge: lt9611uxc: support displays with up to 4 EDID blocks
config: i386-randconfig-014-20260518 (https://download.01.org/0day-ci/archive/20260518/202605180800.luZQCJZK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180800.luZQCJZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180800.luZQCJZK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:386,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:100,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:8,
                    from drivers/gpu/drm/bridge/lontium-lt9611uxc.c:7:
   In function 'memcmp',
       inlined from 'lt9611uxc_get_edid_block' at drivers/gpu/drm/bridge/lontium-lt9611uxc.c:454:23:
>> include/linux/fortify-string.h:719:25: error: call to '__read_overflow2' declared with attribute error: detected read beyond size of object (2nd parameter)
     719 |                         __read_overflow2();
         |                         ^~~~~~~~~~~~~~~~~~


vim +/__read_overflow2 +719 include/linux/fortify-string.h

a28a6e860c6cf23 Francis Laniel 2021-02-25  708  
92df138a8d663ce Kees Cook      2022-02-08  709  __FORTIFY_INLINE __diagnose_as(__builtin_memcmp, 1, 2, 3)
281d0c962752fb4 Kees Cook      2022-02-08  710  int memcmp(const void * const POS0 p, const void * const POS0 q, __kernel_size_t size)
a28a6e860c6cf23 Francis Laniel 2021-02-25  711  {
21a2c74b0a2a784 Kees Cook      2023-04-07  712  	const size_t p_size = __struct_size(p);
21a2c74b0a2a784 Kees Cook      2023-04-07  713  	const size_t q_size = __struct_size(q);
a28a6e860c6cf23 Francis Laniel 2021-02-25  714  
a28a6e860c6cf23 Francis Laniel 2021-02-25  715  	if (__builtin_constant_p(size)) {
fa35198f39571bb Kees Cook      2022-09-19  716  		if (__compiletime_lessthan(p_size, size))
a28a6e860c6cf23 Francis Laniel 2021-02-25  717  			__read_overflow();
fa35198f39571bb Kees Cook      2022-09-19  718  		if (__compiletime_lessthan(q_size, size))
a28a6e860c6cf23 Francis Laniel 2021-02-25 @719  			__read_overflow2();
a28a6e860c6cf23 Francis Laniel 2021-02-25  720  	}
3d965b33e40d973 Kees Cook      2023-04-07  721  	if (p_size < size)
3d965b33e40d973 Kees Cook      2023-04-07  722  		fortify_panic(FORTIFY_FUNC_memcmp, FORTIFY_READ, p_size, size, INT_MIN);
3d965b33e40d973 Kees Cook      2023-04-07  723  	else if (q_size < size)
3d965b33e40d973 Kees Cook      2023-04-07  724  		fortify_panic(FORTIFY_FUNC_memcmp, FORTIFY_READ, q_size, size, INT_MIN);
a28a6e860c6cf23 Francis Laniel 2021-02-25  725  	return __underlying_memcmp(p, q, size);
a28a6e860c6cf23 Francis Laniel 2021-02-25  726  }
a28a6e860c6cf23 Francis Laniel 2021-02-25  727  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
