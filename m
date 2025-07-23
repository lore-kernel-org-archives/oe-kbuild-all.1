Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1719B1F7060
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753292735; cv=none; b=Wz4MXC5/eXmZScpwuz6wO4zcYb+2Cz8SsAfIxj/QNuH9pqE+vu1EO+yfSUvQepzKsh8EiSs/Wqk0RPBpsuuRyjPwAShXKURJgozcxBzktLQpKOxTmjCwQyYqYV2XUvL3y6pIUxEThk+6lYrFYjwUbiWU//z4wdlIbUYfuvnKu3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753292735; c=relaxed/simple;
	bh=aN97OPKbHjLkAY1nJC2GBhuATTIAmjtpn2fbaVJZc00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sRxogQADLQpj+lGI5T/HrPJidEkV/9Dyef0TTHDPgshxZ4U8BrDFHmaS/1tZo8jJgxHAgnPwwXtlMf2rz0DoL+7iR3VvKs26QDizJcKZZ/vLkbW+MHDDyC/7kxoeOoR+SXIe+JMQs906/pEl9qlcZl9mHdS36iFTYWgpv/X+xn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BaKEWy1o; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaKEWy1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753292734; x=1784828734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aN97OPKbHjLkAY1nJC2GBhuATTIAmjtpn2fbaVJZc00=;
  b=BaKEWy1opz9Ki3U1xr5ANgjwYUvw4RIBsTN8wSmrxJ1It5TqEtjzQ8w6
   Pyv6vnmdaYkMJNWXGcICK+WEgF1SYJh2+Xv31RKk66LrgdEgF814cld1M
   I6uSK97FeToXRryzjdroxAGnG9QNYeBlzGvHbf99BD41RFldq4yJJyXGi
   pRWL13zKb7lUbqtG27jt8tEU2luH3bXaNwhyPMCzSEB+IXz/2+Gyp+xSt
   Sr07IadZHwyDepLz0cWdD9ZvjgfTnNa5lrVoZ+q/r3pAtOlbmxfDc+8XH
   2QgXjOtiA1ZyNZ/tbfmp8Jtsf3FOdJIaXDcZQvLr0O19K5VzKDAhLut/l
   Q==;
X-CSE-ConnectionGUID: XSV/PAvCT4yXj/1UwBjj9w==
X-CSE-MsgGUID: fj1r3gLaSI2eYDGFMZDdoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73043032"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="73043032"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:45:34 -0700
X-CSE-ConnectionGUID: my5rtts4TCiohKe59frbgA==
X-CSE-MsgGUID: ag8GRKjCSM2nX20n81fT8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="159417982"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 23 Jul 2025 10:45:33 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uedX0-00001D-26;
	Wed, 23 Jul 2025 17:45:30 +0000
Date: Wed, 23 Jul 2025 14:59:45 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 8/26] drivers/hid/hid-magicmouse.c:585:
 warning: Excess struct member 'crc16' description in 'tp_finger'
Message-ID: <202507231431.a1H0A5Nr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   9da5f109e42a00118fe6327d7774c46116780937
commit: f6203abdbed12528a980101b4fbea1793f1a9ffa [8/26] HID: magicmouse: add support for Macbook trackpads
config: alpha-randconfig-2002-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231431.a1H0A5Nr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231431.a1H0A5Nr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231431.a1H0A5Nr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-magicmouse.c:585: warning: Excess struct member 'crc16' description in 'tp_finger'
   drivers/hid/hid-magicmouse.c:607: warning: expecting prototype for struct trackpad. Prototype was for struct tp_header instead


vim +585 drivers/hid/hid-magicmouse.c

   548	
   549	/**
   550	 * struct tp_finger - single trackpad finger structure, le16-aligned
   551	 *
   552	 * @unknown1:		unknown
   553	 * @unknown2:		unknown
   554	 * @abs_x:		absolute x coordinate
   555	 * @abs_y:		absolute y coordinate
   556	 * @rel_x:		relative x coordinate
   557	 * @rel_y:		relative y coordinate
   558	 * @tool_major:		tool area, major axis
   559	 * @tool_minor:		tool area, minor axis
   560	 * @orientation:	16384 when point, else 15 bit angle
   561	 * @touch_major:	touch area, major axis
   562	 * @touch_minor:	touch area, minor axis
   563	 * @unused:		zeros
   564	 * @pressure:		pressure on forcetouch touchpad
   565	 * @multi:		one finger: varies, more fingers: constant
   566	 * @crc16:		on last finger: crc over the whole message struct
   567	 *			(i.e. message header + this struct) minus the last
   568	 *			@crc16 field; unknown on all other fingers.
   569	 */
   570	struct tp_finger {
   571		__le16 unknown1;
   572		__le16 unknown2;
   573		__le16 abs_x;
   574		__le16 abs_y;
   575		__le16 rel_x;
   576		__le16 rel_y;
   577		__le16 tool_major;
   578		__le16 tool_minor;
   579		__le16 orientation;
   580		__le16 touch_major;
   581		__le16 touch_minor;
   582		__le16 unused[2];
   583		__le16 pressure;
   584		__le16 multi;
 > 585	} __attribute__((packed, aligned(2)));
   586	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
