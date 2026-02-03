Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9091A08BC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770152996; cv=none; b=Jh+OdIHxL4O1skQapezsYVKPc73tiBfp3Jy+Py11c0x1sUE/E8oaHjouRyj/FIaV9uahxsLKY3fv82+Z0pqyzwFKFZTKreQ8MBeQIpTiIL9V2QW+nO/D1P/3eBsnsV4Jc7JPGOmY3qoTdwwIJ4F++zp8I16kQ/msKofqoc/wU+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770152996; c=relaxed/simple;
	bh=dV0bUe4m9XMxcS91TdZPtwfePXR53y+4uKoJadksJHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AWYOlwuSpfv3N1lz/W57kCqbrcIrIOBVEONXnKJ/bxzSqzL+9259q5gIGRXZBwsVF1HrfVOgqdATDD2v/8T0OhSho9XD9xeIBJb0dtbbImLZ+qu6WZw6BWBrcMrz3sq1EwjKiQ5AIpTAdWj2hR5ytbbpHgwi1wUAUj6PDo5GiVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XliG2Q+F; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XliG2Q+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770152995; x=1801688995;
  h=date:from:to:cc:subject:message-id;
  bh=dV0bUe4m9XMxcS91TdZPtwfePXR53y+4uKoJadksJHY=;
  b=XliG2Q+Fzeb78eCSzp8Y5i4/Ln6q+NwLA/Iy1QT2ygISusUP92mhi4pF
   fLWJIJRc68QpjpDRIZITdhu9MRVAoMvo2cgN+lcRFIobpOWLnKlFreMNO
   K8m/6aZDH+yIOmB2aU1fn7DRjM0xLKOfRLfYl1M1XU9ajP+RPvaUxJT1u
   uD7jsY7n3DUVDuLUAwtBwRT9LyeWwVoqWStJRESSiiVxjnZpDBBk7gfvC
   zhxZu8beGtYom94ZDTg2rbf8E+lOvX3O+rGjdR7D23ktrj2ZlVQ1oqwE+
   7dU27Vaa5oVFpa3JkhI4i2B4VgSNDmoRJHyOmUkjnBuc/tKQk9s5ETCGH
   w==;
X-CSE-ConnectionGUID: Bf198asXQgSfPjW2ogzsZA==
X-CSE-MsgGUID: RIn1D7FVRmadaK3kskjRDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71234206"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71234206"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 13:09:54 -0800
X-CSE-ConnectionGUID: eFC61E+YS1eE+ZB4cBcTQQ==
X-CSE-MsgGUID: DJ4NsKGdT566CSGQ3diSGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214116598"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2026 13:09:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnNeg-000000003TF-28Kh;
	Tue, 03 Feb 2026 21:09:50 +0000
Date: Tue, 03 Feb 2026 22:09:04 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/ipv4/tcp_output.c:1482:13: warning: 'tcp_v4_send_check'
 defined but not used
Message-ID: <202602032233.JaVYcsqF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/tcp-inline-__tcp_v4_send_check/20260203-224938
head:   b44f2c807084fe7b385668a4e7e54449f3a046de
commit: b44f2c807084fe7b385668a4e7e54449f3a046de tcp: make tcp_v{4,6}_send_check() static
date:   6 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260203/202602032233.JaVYcsqF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032233.JaVYcsqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602032233.JaVYcsqF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_output.c:1482:13: warning: 'tcp_v4_send_check' defined but not used [-Wunused-function]
    1482 | static void tcp_v4_send_check(struct sock *sk, struct sk_buff *skb)
         |             ^~~~~~~~~~~~~~~~~


vim +/tcp_v4_send_check +1482 net/ipv4/tcp_output.c

  1480	
  1481	/* This routine computes an IPv4 TCP checksum. */
> 1482	static void tcp_v4_send_check(struct sock *sk, struct sk_buff *skb)
  1483	{
  1484		const struct inet_sock *inet = inet_sk(sk);
  1485	
  1486		__tcp_v4_send_check(skb, inet->inet_saddr, inet->inet_daddr);
  1487	}
  1488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
