Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8A55E5E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520600; cv=none; b=cQzCYc+gT5PpjbfWgNv3Y4AnYsDLE946jhjIRtw2riTlSU3fZLFmhLOvBrpA4Bg0JahWWa5AKfvCY+XshuMsKAWgB7G3d1K1ssP6xq873E7CBevoE/mAtf/N2fPG1S7rqnicJ4VIEkD/2v9UeYUt31rf/U+ETreYyB0c2zydXHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520600; c=relaxed/simple;
	bh=BSF7pZJ5FBuWz3p9e5agHrfWxsJVUhGcoElEUBipzHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZnZx57uuLrw0cdABmRzuXFA5sQMbywJuhGRYQMLc6M341T47fIB5Lx7Wgp+tS+2LBNEqOQKtJWpmXY7merRLOG2sQ9+ZvbqjrjLD4xTNYaUrSmDSFdTlaklphKhawSGuBUqWJKLtpH2pcD31hK8/EzaviE4I2Fj7kv1t2iFU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnkam9/K; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnkam9/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708520598; x=1740056598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BSF7pZJ5FBuWz3p9e5agHrfWxsJVUhGcoElEUBipzHo=;
  b=bnkam9/KHhWDClT9ns/MjuVKbtfvT79KMMXHtvbng57fHvoSQERnsWlR
   0UEcHbU1YU8ebukJlV5sTs2eS0lvZLex3ClLGRLsiDvjn0dkA1fGvrkR9
   sBMVe1bqwUEIKjhfLr+CWpgN6/ohy+lKx5SKshmr3h9FB1V0MuGkktGmJ
   gC4jpkSB6wRmxbQ89mHxUksYKeErms1/iSJKk1yr82kcAlUg125mU93KA
   pq0t+SnZ7fN6+dC+lzrH7oJrG+FYMQXDWispXrGA4q9gzrKhiOeGVJa7T
   J3qhqymQ4hDzd/G15DHSLQ+x0foNh/+5t4EX0On8NIQWOv5B4JRi5ERGp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5631952"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5631952"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 05:03:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9745646"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Feb 2024 05:03:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcmFh-0005Ke-31;
	Wed, 21 Feb 2024 13:03:09 +0000
Date: Wed, 21 Feb 2024 21:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [drm-xe:drm-xe-next 1/3] arch/arm64/kernel/hyp-stub.S:289: Error:
 found 'l', expected: ')'
Message-ID: <202402212056.HpTtC3jO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   87fc1e8b66fead9b3bb462f83444f3203585c7ee
commit: b77cb9640f1f7ea93d5ae0546cfe9602eba2157a [1/3] bits: introduce fixed-type genmasks
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240221/202402212056.HpTtC3jO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402212056.HpTtC3jO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402212056.HpTtC3jO-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/hyp-stub.S: Assembler messages:
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:289: Error: unexpected characters following instruction at operand 2 -- `mov x1,#(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(0))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(3)))))'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:323: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:323: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:323: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:323: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:323: Error: unexpected characters following instruction at operand 3 -- `orr x0,x0,(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(31))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(31)))))'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:330: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:330: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:330: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:330: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:330: Error: unexpected characters following instruction at operand 3 -- `orr x0,x0,(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(30))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(30)))))'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:333: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:333: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:333: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:333: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:333: Error: unexpected characters following instruction at operand 3 -- `orr x0,x0,#(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(0))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(3)))))'
   arch/arm64/kernel/hyp-stub.S:77:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:571: Error: non-constant expression in ".if" statement
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:571: Error: junk at end of line, first unrecognized character is `l'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:574: Error: non-constant expression in ".if" statement
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:574: Error: junk at end of line, first unrecognized character is `l'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:577: Error: unexpected characters following instruction at operand 2 -- `movz x0,:abs_g3:(0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11))))))'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:578: Error: unexpected characters following instruction at operand 2 -- `movk x0,:abs_g2_nc:(0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11))))))'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:580: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:580: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:580: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:580: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:580: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:580: Error: unexpected characters following instruction at operand 2 -- `movk x0,:abs_g1_nc:(0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11))))))'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:582: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:582: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:582: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:582: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
   arch/arm64/kernel/hyp-stub.S:582: Error: found 'l', expected: ')'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
>> arch/arm64/kernel/hyp-stub.S:582: Error: unexpected characters following instruction at operand 2 -- `movk x0,:abs_g0_nc:(0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11))))))'
   arch/arm64/kernel/hyp-stub.S:178:  Info: macro invoked from here
--
   arch/arm64/kernel/head.S: Assembler messages:
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: non-constant expression in ".if" statement
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: junk at end of line, first unrecognized character is `l'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: non-constant expression in ".if" statement
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: junk at end of line, first unrecognized character is `l'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:577: Error: unexpected characters following instruction at operand 2 -- `movz x0,:abs_g3:(0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11))))))'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:578: Error: unexpected characters following instruction at operand 2 -- `movk x0,:abs_g2_nc:(0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11))))))'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:580: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:580: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:580: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:580: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:580: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:580: Error: unexpected characters following instruction at operand 2 -- `movk x0,:abs_g1_nc:(0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11))))))'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:582: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:582: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:582: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:582: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
   arch/arm64/kernel/head.S:582: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:582: Error: unexpected characters following instruction at operand 2 -- `movk x0,:abs_g0_nc:(0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11))))))'
   arch/arm64/kernel/head.S:553:  Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
>> arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:571: Error: non-constant expression in ".if" statement
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:571: Error: junk at end of line, first unrecognized character is `l'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: non-constant expression in ".if" statement
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:574: Error: junk at end of line, first unrecognized character is `l'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:577: Error: unexpected characters following instruction at operand 2 -- `movz x0,:abs_g3:((0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(14))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(14))))))'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:578: Error: found 'l', expected: ')'
   arch/arm64/kernel/head.S:29:  Info: macro invoked from here
   arch/arm64/kernel/head.S:221:   Info: macro invoked from here
   arch/arm64/kernel/head.S:577:    Info: macro invoked from here
   arch/arm64/kernel/head.S:578: Error: found 'l', expected: ')'
..


vim +289 arch/arm64/kernel/hyp-stub.S

f1b6cff7c98be2 Marc Zyngier   2021-02-24  159  
f1b6cff7c98be2 Marc Zyngier   2021-02-24  160  	// At the point where we reach enter_vhe(), we run with
7ddb0c3df78812 Marc Zyngier   2022-06-30  161  	// the MMU off (which is enforced by __finalise_el2()).
f1b6cff7c98be2 Marc Zyngier   2021-02-24  162  	// We thus need to be in the idmap, or everything will
f1b6cff7c98be2 Marc Zyngier   2021-02-24  163  	// explode when enabling the MMU.
f1b6cff7c98be2 Marc Zyngier   2021-02-24  164  
f1b6cff7c98be2 Marc Zyngier   2021-02-24  165  	.pushsection	.idmap.text, "ax"
f1b6cff7c98be2 Marc Zyngier   2021-02-24  166  
f1b6cff7c98be2 Marc Zyngier   2021-02-24  167  SYM_CODE_START_LOCAL(enter_vhe)
f359182291c757 Marc Zyngier   2021-02-08  168  	// Invalidate TLBs before enabling the MMU
f359182291c757 Marc Zyngier   2021-02-08  169  	tlbi	vmalle1
f359182291c757 Marc Zyngier   2021-02-08  170  	dsb	nsh
430251cc864beb Marc Zyngier   2021-02-24  171  	isb
f359182291c757 Marc Zyngier   2021-02-08  172  
f359182291c757 Marc Zyngier   2021-02-08  173  	// Enable the EL2 S1 MMU, as set up from EL1
f359182291c757 Marc Zyngier   2021-02-08  174  	mrs_s	x0, SYS_SCTLR_EL12
f359182291c757 Marc Zyngier   2021-02-08  175  	set_sctlr_el1	x0
f359182291c757 Marc Zyngier   2021-02-08  176  
f359182291c757 Marc Zyngier   2021-02-08  177  	// Disable the EL1 S1 MMU for a good measure
f359182291c757 Marc Zyngier   2021-02-08 @178  	mov_q	x0, INIT_SCTLR_EL1_MMU_OFF
f359182291c757 Marc Zyngier   2021-02-08  179  	msr_s	SYS_SCTLR_EL12, x0
f359182291c757 Marc Zyngier   2021-02-08  180  
f359182291c757 Marc Zyngier   2021-02-08  181  	mov	x0, xzr
f359182291c757 Marc Zyngier   2021-02-08  182  
f1b6cff7c98be2 Marc Zyngier   2021-02-24  183  	eret
f1b6cff7c98be2 Marc Zyngier   2021-02-24  184  SYM_CODE_END(enter_vhe)
f1b6cff7c98be2 Marc Zyngier   2021-02-24  185  
f1b6cff7c98be2 Marc Zyngier   2021-02-24  186  	.popsection
f359182291c757 Marc Zyngier   2021-02-08  187  
712c6ff4dba491 Marc Zyngier   2012-10-19  188  .macro invalid_vector	label
0343a7e46362c3 Mark Brown     2020-05-01  189  SYM_CODE_START_LOCAL(\label)
712c6ff4dba491 Marc Zyngier   2012-10-19  190  	b \label
0343a7e46362c3 Mark Brown     2020-05-01  191  SYM_CODE_END(\label)
712c6ff4dba491 Marc Zyngier   2012-10-19  192  .endm
712c6ff4dba491 Marc Zyngier   2012-10-19  193  
712c6ff4dba491 Marc Zyngier   2012-10-19  194  	invalid_vector	el2_sync_invalid
712c6ff4dba491 Marc Zyngier   2012-10-19  195  	invalid_vector	el2_irq_invalid
712c6ff4dba491 Marc Zyngier   2012-10-19  196  	invalid_vector	el2_fiq_invalid
712c6ff4dba491 Marc Zyngier   2012-10-19  197  	invalid_vector	el2_error_invalid
712c6ff4dba491 Marc Zyngier   2012-10-19  198  	invalid_vector	el1_sync_invalid
712c6ff4dba491 Marc Zyngier   2012-10-19  199  	invalid_vector	el1_irq_invalid
712c6ff4dba491 Marc Zyngier   2012-10-19  200  	invalid_vector	el1_fiq_invalid
712c6ff4dba491 Marc Zyngier   2012-10-19  201  	invalid_vector	el1_error_invalid
712c6ff4dba491 Marc Zyngier   2012-10-19  202  
e30be1455bd3b0 Quentin Perret 2021-01-28  203  	.popsection
e30be1455bd3b0 Quentin Perret 2021-01-28  204  
712c6ff4dba491 Marc Zyngier   2012-10-19  205  /*
712c6ff4dba491 Marc Zyngier   2012-10-19  206   * __hyp_set_vectors: Call this after boot to set the initial hypervisor
712c6ff4dba491 Marc Zyngier   2012-10-19  207   * vectors as part of hypervisor installation.  On an SMP system, this should
712c6ff4dba491 Marc Zyngier   2012-10-19  208   * be called on each CPU.
712c6ff4dba491 Marc Zyngier   2012-10-19  209   *
712c6ff4dba491 Marc Zyngier   2012-10-19  210   * x0 must be the physical address of the new vector table, and must be
712c6ff4dba491 Marc Zyngier   2012-10-19  211   * 2KB aligned.
712c6ff4dba491 Marc Zyngier   2012-10-19  212   *
712c6ff4dba491 Marc Zyngier   2012-10-19  213   * Before calling this, you must check that the stub hypervisor is installed
712c6ff4dba491 Marc Zyngier   2012-10-19  214   * everywhere, by waiting for any secondary CPUs to be brought up and then
712c6ff4dba491 Marc Zyngier   2012-10-19  215   * checking that is_hyp_mode_available() is true.
712c6ff4dba491 Marc Zyngier   2012-10-19  216   *
712c6ff4dba491 Marc Zyngier   2012-10-19  217   * If not, there is a pre-existing hypervisor, some CPUs failed to boot, or
712c6ff4dba491 Marc Zyngier   2012-10-19  218   * something else went wrong... in such cases, trying to install a new
712c6ff4dba491 Marc Zyngier   2012-10-19  219   * hypervisor is unlikely to work as desired.
712c6ff4dba491 Marc Zyngier   2012-10-19  220   *
712c6ff4dba491 Marc Zyngier   2012-10-19  221   * When you call into your shiny new hypervisor, sp_el2 will contain junk,
712c6ff4dba491 Marc Zyngier   2012-10-19  222   * so you will need to set that to something sensible at the new hypervisor's
712c6ff4dba491 Marc Zyngier   2012-10-19  223   * initialisation entry point.
712c6ff4dba491 Marc Zyngier   2012-10-19  224   */
712c6ff4dba491 Marc Zyngier   2012-10-19  225  
0343a7e46362c3 Mark Brown     2020-05-01  226  SYM_FUNC_START(__hyp_set_vectors)
ad72e59ff2bad5 Geoff Levand   2016-04-27  227  	mov	x1, x0
ad72e59ff2bad5 Geoff Levand   2016-04-27  228  	mov	x0, #HVC_SET_VECTORS
00a44cdaba0900 James Morse    2016-04-27  229  	hvc	#0
00a44cdaba0900 James Morse    2016-04-27  230  	ret
0343a7e46362c3 Mark Brown     2020-05-01  231  SYM_FUNC_END(__hyp_set_vectors)
fd0e0c617089e7 Marc Zyngier   2017-04-03  232  
0343a7e46362c3 Mark Brown     2020-05-01  233  SYM_FUNC_START(__hyp_reset_vectors)
fd0e0c617089e7 Marc Zyngier   2017-04-03  234  	mov	x0, #HVC_RESET_VECTORS
fd0e0c617089e7 Marc Zyngier   2017-04-03  235  	hvc	#0
fd0e0c617089e7 Marc Zyngier   2017-04-03  236  	ret
0343a7e46362c3 Mark Brown     2020-05-01  237  SYM_FUNC_END(__hyp_reset_vectors)
0c93df9622d4d9 Marc Zyngier   2021-02-08  238  
0c93df9622d4d9 Marc Zyngier   2021-02-08  239  /*
7ddb0c3df78812 Marc Zyngier   2022-06-30  240   * Entry point to finalise EL2 and switch to VHE if deemed capable
005e12676af09a Ard Biesheuvel 2022-06-24  241   *
005e12676af09a Ard Biesheuvel 2022-06-24  242   * w0: boot mode, as returned by init_kernel_el()
0c93df9622d4d9 Marc Zyngier   2021-02-08  243   */
7ddb0c3df78812 Marc Zyngier   2022-06-30  244  SYM_FUNC_START(finalise_el2)
0c93df9622d4d9 Marc Zyngier   2021-02-08  245  	// Need to have booted at EL2
0c93df9622d4d9 Marc Zyngier   2021-02-08  246  	cmp	w0, #BOOT_CPU_MODE_EL2
0c93df9622d4d9 Marc Zyngier   2021-02-08  247  	b.ne	1f
0c93df9622d4d9 Marc Zyngier   2021-02-08  248  
0c93df9622d4d9 Marc Zyngier   2021-02-08  249  	// and still be at EL1
0c93df9622d4d9 Marc Zyngier   2021-02-08  250  	mrs	x0, CurrentEL
0c93df9622d4d9 Marc Zyngier   2021-02-08  251  	cmp	x0, #CurrentEL_EL1
0c93df9622d4d9 Marc Zyngier   2021-02-08  252  	b.ne	1f
0c93df9622d4d9 Marc Zyngier   2021-02-08  253  
7ddb0c3df78812 Marc Zyngier   2022-06-30  254  	mov	x0, #HVC_FINALISE_EL2
0c93df9622d4d9 Marc Zyngier   2021-02-08  255  	hvc	#0
0c93df9622d4d9 Marc Zyngier   2021-02-08  256  1:
0c93df9622d4d9 Marc Zyngier   2021-02-08  257  	ret
7ddb0c3df78812 Marc Zyngier   2022-06-30  258  SYM_FUNC_END(finalise_el2)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
