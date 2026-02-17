Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CFF19C546
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771357087; cv=none; b=reDAgDMeIQQpbLEB9cjvNrnRrFh5LyI+AW4aaj9e/47wNQdaVn8TbvOpIXnFZVG1uqseRDxa4RjWh2F9bRkB3EGPlgSA3G9Ga7D7YwcYRTrx+PNUmWj7S47w0PmKu64fvqeNBG5q1N2b/LA0Gx+ZW4nqPxPKMDFt+0a1MC5Nw60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771357087; c=relaxed/simple;
	bh=MrlosPCl9pyaSFiv30wKlQOZpXJemPNviUQwL4NEu6w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=acTJ5g/dXH7Kif4OLFwCM50kZSqGD0TLJ6E9ye6M6ZYxuCS3TAT4fxzINGyofJUWoq7rn91Y0h6H+QJNk21FOeWCum+WZzfL/UMKcWr+H7iMzBZvL8e0FCIMAZu3hsq5m7u9BKntQtiXQj5bh8fZlqSrFPQ74hHTMyCUKIsXDgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+yd09Nd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+yd09Nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771357085; x=1802893085;
  h=date:from:to:cc:subject:message-id;
  bh=MrlosPCl9pyaSFiv30wKlQOZpXJemPNviUQwL4NEu6w=;
  b=l+yd09Nd4dYztNI3eBvTGYNfeJOJ8y8GE8t2h1w5ID+OcKGl781LQzK4
   q4pEFCq63daHTjq3uA+ifIInMzD9EGuG/HNMz3BAUqC3S8v+0L7T2MK/+
   q+5GgsYehuYsCDhXx7oci7ZQWZW75Cci9+5RCBJPjMI+Wfp4gpMdmGy+H
   JKTT96MBIr7OYEvJztxoRoqxYaLAhkyyL5573J4cn04W4BYlrC7pyWagO
   dGMNuiH0rG6o6HDUcr90lUPuyVPR+waAUtj1YuafCjkXbl5nhJiPc5Hrv
   T18CA8yNiNVPlqF+ZhWJEz3M9if9HQTQ9Ez4VVg2EJ/f0OkhlQlEyheUS
   w==;
X-CSE-ConnectionGUID: +26RLC74T+6RgGgltM82Dw==
X-CSE-MsgGUID: JKJnwk68Qo2z+eLiLTkCWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83799486"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="83799486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 11:38:04 -0800
X-CSE-ConnectionGUID: FQHv6RnqR5WJFIXEmJXbpw==
X-CSE-MsgGUID: PixjCg5/Szuj71gYbiQRBw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2026 11:38:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsQtU-000000011LQ-1f0s;
	Tue, 17 Feb 2026 19:38:00 +0000
Date: Wed, 18 Feb 2026 03:37:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ralf Lici <ralf@mandelbit.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Antonio Quartulli <antonio@openvpn.net>,
 Sabrina Dubroca <sd@queasysnail.net>
Subject: [openvpn-ovpn-net-next:development 4/14] Warning:
 drivers/net/ovpn/netlink.c:1214 expecting prototype for
 ovpn_nl_float_peer_notify(). Prototype was for ovpn_nl_peer_float_notify()
 instead
Message-ID: <202602180356.M6nZnYqp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/OpenVPN/ovpn-net-next development
head:   ef09f5c6b4a0ca167acdb573ba075008159652b4
commit: 8ed8f0da1386eb750bce1fc74850a75490457d1f [4/14] ovpn: notify userspace on client float event
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260218/202602180356.M6nZnYqp-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180356.M6nZnYqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180356.M6nZnYqp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ovpn/netlink.c:1214 expecting prototype for ovpn_nl_float_peer_notify(). Prototype was for ovpn_nl_peer_float_notify() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
