Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADD5304BB7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 04:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767155904; cv=none; b=gW4LAdbWoaqMYlRORhevoNhKP4qnKxjb+tSPZO7dh126LwVEL8tFIzB+h5RG/FIJhBWirlrt0B86CSSo7w46A2cl64CCl/54It0uZfhQm+kjuW2DNp+v6zFNNCyyMBSF8TFLSPnAZQT5r+wxq2BDFDBjxab4mglMlGnSfxx1YeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767155904; c=relaxed/simple;
	bh=ZvIzbrr6GckazkhoXmlXZ0LQEGN5rHz/dfwH5eShIAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gnU2jXnWujOHzDH/bbPiEYgHsXG7PSktNLD2ZGciw34OEEDMY3FZxs1SxN2tNf22XjTnkaQuQCWmVG6qOdtkCPp9pzox0jQd2nyMNw/0RP5BUE8s2wcAZUyD8g1yGLB2kGuDu8W0OkJtYNn1vbTeknfzNUlnWi4uDZBRZMCyS0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcKGXLGz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcKGXLGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767155902; x=1798691902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZvIzbrr6GckazkhoXmlXZ0LQEGN5rHz/dfwH5eShIAE=;
  b=lcKGXLGzrgzv0aw+ZaSbi5Zr8gwSTHh07lE4mkMEZ6WxulCt1572ujqV
   iqUqpsW6X8ZrDJ0avskeE9L7tpmsCH9xhM5TxK41VLBVkz1NxxNd0+b+k
   o6p2Z0Xgy9x6VRmo91flkaIP+SqWIlaiQYhiqmVL64mU5L5dxpeMMmeq5
   W1OhjfSyr7Qe8h0AVuwPnMzVDiNqasDtWAls8DwHIv20YejU6HSDxr2o8
   LvNq2hu5ORcOPHxBBAJz7dWJNolOcu2DF9NTiMY997lo/OliqPdG1JmjN
   B/HcPJDTPi7C44H0jnIcpDWDhXO5wCsmyduJIIFQ+US8V7BtjHMXEAqLF
   Q==;
X-CSE-ConnectionGUID: uelGbp/AT+KQ2dDBhB9CcQ==
X-CSE-MsgGUID: aRtP81qKRuW+kvI/BPEqaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79365161"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="79365161"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 20:38:22 -0800
X-CSE-ConnectionGUID: i08N2NnGT2KAVln+0MudqQ==
X-CSE-MsgGUID: B3WIELznRZKNi+59m9DEtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="200498029"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Dec 2025 20:38:21 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vanyU-0000000085w-0tvo;
	Wed, 31 Dec 2025 04:38:18 +0000
Date: Wed, 31 Dec 2025 05:38:14 +0100
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>,
	Yuan Yao <yaoyuan0329os@gmail.com>
Subject: [sean-jc:slf/amx_xfd_non_init 4/5] Warning:
 arch/x86/kernel/fpu/core.c:332 function parameter 'gfpu' not described in
 'fpu_sync_guest_vmexit_xfd_state'
Message-ID: <202512310544.HWXKjNT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux slf/amx_xfd_non_init
head:   33fa9d8a2137bc45ef495066cac99a3fdc05ef28
commit: e3ab3b0cd9dfa94c6d7f2ce7abce7a24422a9931 [4/5] x86, fpu: separate fpstate->xfd and guest XFD
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251231/202512310544.HWXKjNT0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512310544.HWXKjNT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512310544.HWXKjNT0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/kernel/fpu/core.c:332 function parameter 'gfpu' not described in 'fpu_sync_guest_vmexit_xfd_state'
>> Warning: arch/x86/kernel/fpu/core.c:332 function parameter 'gfpu' not described in 'fpu_sync_guest_vmexit_xfd_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
