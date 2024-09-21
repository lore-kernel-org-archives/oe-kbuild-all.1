Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9A2F41
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 08:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726905758; cv=none; b=kxSkNE2TZyvjYYfC+y17jtY/0puDYCLvvi0DmwpRzvbe7yATgvhggdW2KHspsOoi4Y3v04xqiJJfZ6+0zfvwqglXcq+h4qu6Yzkaq6BXmTZRmWpKXuVRnmoa4bFdkfX48xolvIiKMH0A/vQjJ4G8Yvsg491nnuqlphLZBW1i57g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726905758; c=relaxed/simple;
	bh=kCAl/MDamX5HRUXAhiPADv1EY76Tr9+68unNXyDxnCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYqEugZJXAdbDKRecndXC8eJipdbEfzJhSktHk+B36xENefIkQzM+AF3KR1d0PNVW4E7jAjwa6C4kB95Fze5G1FCzsOLdSs0aYqYNMpS7RF6Qpn/vzKocvmQsLKR6u+luWcSs0dg/MqsHTdNbZycJZ4xydbQlrqAL5OKiUAKnzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZ7+7npW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZ7+7npW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726905756; x=1758441756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kCAl/MDamX5HRUXAhiPADv1EY76Tr9+68unNXyDxnCs=;
  b=cZ7+7npWgt9oPYBM8mgSXBu9YGp7kys3c6FQnfTQrzO8hWqYrsh/s41c
   mtzxDdKPSEXGTC8VnmypFkWHo/mw5McDPwirkgtxlVxVhpMuBesob+KNx
   jQgywMskev4ZTrWkXSWBuWOXhTqgvfMDTO/nCmOmDcKfP5QYyQdI47Bq0
   KvDtwuZIN+vfDuit9cW7PXzMCO5Eogtk+4oi4zwd3cOdFZuF9cvMpbeFa
   OeFsY4ybZ9xH+uPJiIIAQMJHu1ZA41Fm8Lzz1roAg5AwJZcg+rJ8xoBju
   xVVGg3SeEC1EDiNZW8FwNeLv1ZWXs/G7AzviMny7ENhs4WjqDTcbwu4Rw
   g==;
X-CSE-ConnectionGUID: /ksZuAxSRZKX92HeyKMDqA==
X-CSE-MsgGUID: FNFCUQOhRRSehHig2dBBpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25396143"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="25396143"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 01:02:35 -0700
X-CSE-ConnectionGUID: kHj9x7aVRoaZUiM2M6/0jw==
X-CSE-MsgGUID: emGFWN9cRHmgKw8Tjbqt2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="107984553"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Sep 2024 01:02:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srv4Z-000FDv-0T;
	Sat, 21 Sep 2024 08:02:31 +0000
Date: Sat, 21 Sep 2024 16:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 7193/23724] net/9p/client.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202409211531.7WSQbHuU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   369b68f40ab0c9bf0a8e087ed7ced93dcad3cd6c
commit: a6fb923f7803f40a567445dfe1ff3a539c8adc1f [7193/23724] 9p: Use a slab for allocating requests
config: x86_64-buildonly-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240921/202409211531.7WSQbHuU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211531.7WSQbHuU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211531.7WSQbHuU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/9p/client.c:376: warning: Function parameter or member 'c' not described in 'p9_client_cb'
   net/9p/client.c:376: warning: Function parameter or member 'req' not described in 'p9_client_cb'
   net/9p/client.c:376: warning: Function parameter or member 'status' not described in 'p9_client_cb'
   net/9p/client.c:523: warning: Function parameter or member 'uidata' not described in 'p9_check_zc_errors'
   net/9p/client.c:774: warning: Function parameter or member 'in_hdrlen' not described in 'p9_client_zc_rpc'
   net/9p/client.c:774: warning: Excess function parameter 'hdrlen' description in 'p9_client_zc_rpc'
>> net/9p/client.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
