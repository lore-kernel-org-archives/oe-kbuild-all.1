Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD02AEFE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 21:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728423195; cv=none; b=plbBv6K8SvROkNoYjVewvJJZD1kOc/rCyzvxRpI3gOfUegGjYO5Y3RMzVrb4B+5v86yiloxpaBb41ryEiCBX6DORGC/gUY89yttjRtS6x8yAaZUWkMtDrojxexfxemuN8hzUwssnttsmJ7pvsN0RIOMNHiw6dlo7IK0Qjaawtz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728423195; c=relaxed/simple;
	bh=J7cLXuMv8ba9cmqFU2H9g2Ipa8K5iP0tE34MpOX6x7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WnGjXgjKHKai2Io7T1q8m09jAEmBDBjdqnuvI/4qsYlubzsihsbcBzVYa0+y+/A374s6V5H8CLBo59XIVM02pXFtX1IfqUsNV18VMWWw45SUAD048ry6LkyRWb1cVQLToSTmc+oDaOEIgIu3Ok3MbyjVx1FqPE/iKeOtr2XRoYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DE4bGs5p; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DE4bGs5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728423194; x=1759959194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7cLXuMv8ba9cmqFU2H9g2Ipa8K5iP0tE34MpOX6x7A=;
  b=DE4bGs5pE17qIyA8F+d1/i2IYzsgdpf9QSnUg/FStdMBuvkRaXaF1Jwm
   9kVOnrUbRUQeLBAkJuXF/lWQpTmYVh0kjnId070Vf0deNxdwwZ7JRd2Vd
   txpLc4nRDQ4RJIR9Gk0eH+R/Qd8zH6Rlzzg9Iodnj9hZu6PCYirBwQcLI
   2aga9A8I7W1WGVo2MNcUMtAa80bnzmtWpou9JapLj2za90m65eOurOg2t
   wsDEJGHaMd0gzSBslRenFxuI4GpxljZZ1VJN+wf9AUaLhGyc9nfJa92ea
   RshBq5ffJkBJqH6UpemniNqM1fKotjvQ7LGJNi/+MlR24WpkHSdkEQzOq
   g==;
X-CSE-ConnectionGUID: ECrzFOpzROy7NNkyhpINSA==
X-CSE-MsgGUID: HsybSRvCQfW1gtyfl4gjYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31562506"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="31562506"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 14:33:12 -0700
X-CSE-ConnectionGUID: vfIBIlGaQFiwhy0BtdAkSA==
X-CSE-MsgGUID: eAbxl3MYSZ2+HsPiSyMjLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="99349267"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Oct 2024 14:33:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syHpM-0008Ok-1b;
	Tue, 08 Oct 2024 21:33:08 +0000
Date: Wed, 9 Oct 2024 05:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Guillaume Nault <gnault@redhat.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Willem de Bruijn <willemb@google.com>
Subject: net/ipv4/inet_diag.c:1511:17: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202410090504.9CJsN8Ma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5b7c893ed5ed0fc1cbe28c0e3296a6fb45698486
commit: 223f55196bbdb182a9b8de6108a0834b5e5e832e inet_diag: allow concurrent operations
date:   9 months ago
config: hexagon-randconfig-r113-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090504.9CJsN8Ma-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410090504.9CJsN8Ma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090504.9CJsN8Ma-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/inet_diag.c:1511:17: sparse: sparse: Using plain integer as NULL pointer

vim +1511 net/ipv4/inet_diag.c

  1503	
  1504	int inet_diag_register(const struct inet_diag_handler *h)
  1505	{
  1506		const __u16 type = h->idiag_type;
  1507	
  1508		if (type >= IPPROTO_MAX)
  1509			return -EINVAL;
  1510	
> 1511		return !cmpxchg((const struct inet_diag_handler **)&inet_diag_table[type],
  1512				NULL, h) ? 0 : -EEXIST;
  1513	}
  1514	EXPORT_SYMBOL_GPL(inet_diag_register);
  1515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
