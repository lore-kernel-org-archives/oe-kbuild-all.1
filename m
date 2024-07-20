Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244981E504
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 23:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721518439; cv=none; b=eYlposRUB3d/B6SSWF2TOq10UhUqsVQkniCECb+yywCHZH99a3QWUpkW5Bu9gCVoflakek+sfWkvOg2sT1k7ot9OOATNZ2+AnHhHTGKRQZTxRD+Gk9rqBcz7wWFasPwTQ/q5EBiThIGNMVJlWqflUcgRMQ9eYNLhuTPDuLtSm3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721518439; c=relaxed/simple;
	bh=n5Qs6cW6v667vuUqnXx0YibMwV+1FQLX+/QIyN0e76A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L3bzUuK9l/Fw39QL6jm3JJBMy/guciuqyDuVjvchMBtEweKGuzkN3ct18NHdsHLegthx9sQlGo1BtLIKZz2x9+YhUpukFpmGLsMKB4+2Hd5GZqbcA/ch1fTRB7l1hlocD7YvdvmyZOKwydR70wW85Zk8d9L1J0b+sEHHhzunz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqJL6d06; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqJL6d06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721518437; x=1753054437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n5Qs6cW6v667vuUqnXx0YibMwV+1FQLX+/QIyN0e76A=;
  b=ZqJL6d0600oS9QhLFscctgWFtfQRw4nTUDJI1tl5zQ5/6V3R4xKEuJzr
   659vbbG63vRP4t1DsnIYuSMytbELjc40eu8NE7Oqux+GRARyOepUAIZPB
   TPTlZVYfF9hYA7GP0HIkVtjSbtiG6KJCAsfOGC0nXdKbp7DRr920c0xW7
   Fj17x8DdMw7e4OWNPQJganhBM0Q83KuRcwT6MSJEwL3Ot3Q/we9HMktnA
   nft7fxPL/P5O+VlDEhTghsqjGecwSWmTnujwM+m3m8GBjrB+XEppgOg9C
   Pi3p3IVFecbRAfmZ6u6UdTzx+m+vAzPzd4I//oouJza5e4ab6iC7el96Z
   Q==;
X-CSE-ConnectionGUID: lOAsCvQKQsS7y81a3SyNLA==
X-CSE-MsgGUID: CVmbRQAATQ+bsnhQru83tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18931333"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="18931333"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 16:33:56 -0700
X-CSE-ConnectionGUID: roF3YeZFQJa5/+UMrW0cfw==
X-CSE-MsgGUID: 1SR9elcSTn+dq6Dd0PzSzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="51483667"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Jul 2024 16:33:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVJaL-000jiY-1p;
	Sat, 20 Jul 2024 23:33:53 +0000
Date: Sun, 21 Jul 2024 07:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/bbr3 1/1] .tmp_gl_tcp_bbr.o:undefined reference to
 `__udivdi3'
Message-ID: <202407210717.y2TVMfL9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.10/bbr3
head:   0f8b7103af11286f08d3228b952997b14bd837f0
commit: 0f8b7103af11286f08d3228b952997b14bd837f0 [1/1] tcp/bbr3: initial import
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20240721/202407210717.y2TVMfL9-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210717.y2TVMfL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210717.y2TVMfL9-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs':
>> .tmp_gl_tcp_bbr.o:(.text+0xfec): undefined reference to `__udivdi3'
   microblaze-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_quantization_budget':
   .tmp_gl_tcp_bbr.o:(.text+0x1118): undefined reference to `__udivdi3'
   microblaze-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_packets_in_net_at_edt':
   .tmp_gl_tcp_bbr.o:(.text+0x2f70): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
