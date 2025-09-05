Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4731284B3E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757093568; cv=none; b=VvpmcGqlK6L14STPUmrqax5bjBBiUeI0RU39dV84frqiHv4BtIC/NfmYer8WVQJOX9XA9I0+6oNhIcbu4Hgy/QlhwdmmI3L8LCXfnA8B2DDdX/fpX1rwQ3MgffWvgLxz9A7WuR/VXrvL76gxzbR5NWuXiyNGfvQVlQYVPCTW3n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757093568; c=relaxed/simple;
	bh=lK2O/xBammCPdQBZhe/2hWMrEK5q7QWxiYFZFBdB/hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alUeC/MbZfAX75br6vqP/H9m4E7twsEZ62FaBi1MqE9rh6ubWKCLCjdfraf/UPUtHuhE5NZgFHXXPadi+VsAJEFzp5BKue6WOgI+zL7saUOClu7zl6ezHdqiDsTSonYQvm/heqrTmg1kcBo/P+4Ok9ehSVdzVBNMsAcUEumxMHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/AcEI5O; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/AcEI5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757093566; x=1788629566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lK2O/xBammCPdQBZhe/2hWMrEK5q7QWxiYFZFBdB/hY=;
  b=h/AcEI5O0kGICBFy21wYoWqdQ1ydezO1DNlE2Bsv+hga73ICTkT9qRj4
   X5SUkCwNxltsjK+blqOyR0l3sYMNaDceLFDRNf34Bv6BZLAiY1NgP9Yd/
   LJ6Em8Y0/Q0czKjO7O2LogXpMS/UhFSJPPO4/omx0V8dfhYaAW+8XAwEK
   +ckdZCU0kfffkTpc1dYvzJmJ4L76GNqk7vLSdzd1C2pRf21SeqBWon+Qt
   tnzfSvxQ3m1aGVUs9//5v9B8OHCnOUyyjGmVbshiQWUbYOQIMZVMiy8TU
   bbj6kH2lV6FaYPsfNMvsjjRey6erdC7s94r1mlW2QQmrrsHk7f8Gw2vym
   Q==;
X-CSE-ConnectionGUID: cW+v1jGDSbySrCAS5c7c7Q==
X-CSE-MsgGUID: 5r5E7D+DQCCaG5esMGiNWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70153257"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="70153257"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 10:32:46 -0700
X-CSE-ConnectionGUID: 1zmXb2lNR1mtf+jZtF9b3w==
X-CSE-MsgGUID: r0ji+lcTSO2f/uurzWZMKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="176307365"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Sep 2025 10:32:43 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuaIi-0000fl-0W;
	Fri, 05 Sep 2025 17:32:40 +0000
Date: Sat, 6 Sep 2025 01:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	Richard Leitner <richard.leitner@linux.dev>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v7 09/10] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Message-ID: <202509060108.kK81M3GB-lkp@intel.com>
References: <20250901-ov9282-flash-strobe-v7-9-d58d5a694afc@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-ov9282-flash-strobe-v7-9-d58d5a694afc@linux.dev>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on d9946fe286439c2aeaa7953b8c316efe5b83d515]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Leitner/media-v4l-ctrls-add-a-control-for-flash-strobe-duration/20250901-231141
base:   d9946fe286439c2aeaa7953b8c316efe5b83d515
patch link:    https://lore.kernel.org/r/20250901-ov9282-flash-strobe-v7-9-d58d5a694afc%40linux.dev
patch subject: [PATCH v7 09/10] media: i2c: ov9282: implement try_ctrl for strobe_duration
config: sh-randconfig-002-20250905 (https://download.01.org/0day-ci/archive/20250906/202509060108.kK81M3GB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060108.kK81M3GB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509060108.kK81M3GB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/media/i2c/ov9282.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
