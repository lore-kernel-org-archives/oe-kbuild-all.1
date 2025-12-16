Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C72A296BC0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 15:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898234; cv=none; b=fHdNXqI9NPDmORxHKupfwvl5Fq7I6/hVIgvf0wun0T1tGZ7LX+lrnqOBp+hZvaCqkq6iUQCn6bvC4VMF80tm9QQLavDQmbt0aFfOwIjOiNtcpsD4IdcHFwVNRVH6IXbbkbuHtTg55DGWloRjscOqJNgW6LKT0fNqVcHqueNi0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898234; c=relaxed/simple;
	bh=YKjWbXqUo82NeIq0MtlpnZSc8nT2/And2yleixFDWvM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B9n5pfPioxLaR3KjCkXu7AMhCseJF/cI13QPcE4w/Yp4rNRL/1I6YIgSbRPdYu+2YfZirwcjNyntXxSpuI4K3EPjY43ULd4D2Ml2tK3S2cTU5iT3qUURVSUgvLKi4zEypVlQP7C2QNAwNhp3JX43xV0SeOu7ScsXej/6BHi/mNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVF2pqOE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVF2pqOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765898231; x=1797434231;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YKjWbXqUo82NeIq0MtlpnZSc8nT2/And2yleixFDWvM=;
  b=gVF2pqOE+iySM/RboNPY/YtxEZ1/r79xG3kX+AG6936oseI6nai3A1cO
   TiAmxTzwd+q0mToKtYsj013fCkJ+RYMPxh1SUY4XNxvIN1oITo+7w6Hlj
   SKA3r880atffe/5kCFgYB0fVyWc+l44M7PqEj1NsDIOncJ8NmbYMwiJ0b
   BVxbkeTtcT5UpEbeRig7DeMwfN49RJQMDPYYp8OInfStsodJENa9WWP2S
   4VCjUYnXspTbJ8sZnvKBAMP3edZTuTF2e/jFWnU2QOv7GaHabwwZXKeg5
   hAjtaIrs210jhdOHF8sjdBpXsH+d1LKwtISP9ha9s2pdD+6kN/NWog7Wo
   w==;
X-CSE-ConnectionGUID: 3UjddElzTESb9lCdJAxazQ==
X-CSE-MsgGUID: 6iEFoIZDT4+9yutX8yoozQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67698861"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67698861"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:17:09 -0800
X-CSE-ConnectionGUID: KcBwj55QQOqCh87O5OzH1Q==
X-CSE-MsgGUID: nUy/83RuQrufkOkntPQWBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197935550"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Dec 2025 07:17:08 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVWn9-000000003Qg-47NI
	for oe-kbuild-all@lists.linux.dev;
	Tue, 16 Dec 2025 15:16:56 +0000
Date: Tue, 16 Dec 2025 23:15:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fred-kvm-v9 19/22]
 arch/x86/kvm/vmx/vmcs12.c:70:9: sparse: sparse: cast truncates bits from
 constant value (814c8 becomes 14c8)
Message-ID: <202512162317.5bbK2glZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fred-kvm-v9
head:   c2a54689d4e994c81376bbaacb5da31c5467101f
commit: 74e1ef2925a795952dc4ca2d4f10edf1b760b54b [19/22] KVM: nVMX: Handle FRED VMCS fields in nested VMX context
config: x86_64-randconfig-123-20251216 (https://download.01.org/0day-ci/archive/20251216/202512162317.5bbK2glZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162317.5bbK2glZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162317.5bbK2glZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/vmx/vmcs12.c:15:9: sparse: sparse: cast truncates bits from constant value (20002 becomes 2)
   arch/x86/kvm/vmx/vmcs12.c:16:9: sparse: sparse: cast truncates bits from constant value (20082 becomes 82)
   arch/x86/kvm/vmx/vmcs12.c:17:9: sparse: sparse: cast truncates bits from constant value (20102 becomes 102)
   arch/x86/kvm/vmx/vmcs12.c:18:9: sparse: sparse: cast truncates bits from constant value (20182 becomes 182)
   arch/x86/kvm/vmx/vmcs12.c:19:9: sparse: sparse: cast truncates bits from constant value (20202 becomes 202)
   arch/x86/kvm/vmx/vmcs12.c:20:9: sparse: sparse: cast truncates bits from constant value (20282 becomes 282)
   arch/x86/kvm/vmx/vmcs12.c:21:9: sparse: sparse: cast truncates bits from constant value (20302 becomes 302)
   arch/x86/kvm/vmx/vmcs12.c:22:9: sparse: sparse: cast truncates bits from constant value (20382 becomes 382)
   arch/x86/kvm/vmx/vmcs12.c:23:9: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
   arch/x86/kvm/vmx/vmcs12.c:24:9: sparse: sparse: cast truncates bits from constant value (20482 becomes 482)
   arch/x86/kvm/vmx/vmcs12.c:25:9: sparse: sparse: cast truncates bits from constant value (30003 becomes 3)
   arch/x86/kvm/vmx/vmcs12.c:26:9: sparse: sparse: cast truncates bits from constant value (30083 becomes 83)
   arch/x86/kvm/vmx/vmcs12.c:27:9: sparse: sparse: cast truncates bits from constant value (30103 becomes 103)
   arch/x86/kvm/vmx/vmcs12.c:28:9: sparse: sparse: cast truncates bits from constant value (30183 becomes 183)
   arch/x86/kvm/vmx/vmcs12.c:29:9: sparse: sparse: cast truncates bits from constant value (30203 becomes 203)
   arch/x86/kvm/vmx/vmcs12.c:30:9: sparse: sparse: cast truncates bits from constant value (30283 becomes 283)
   arch/x86/kvm/vmx/vmcs12.c:31:9: sparse: sparse: cast truncates bits from constant value (30303 becomes 303)
   arch/x86/kvm/vmx/vmcs12.c:32:9: sparse: sparse: cast truncates bits from constant value (80008 becomes 8)
   arch/x86/kvm/vmx/vmcs12.c:32:9: sparse: sparse: cast truncates bits from constant value (80048 becomes 48)
   arch/x86/kvm/vmx/vmcs12.c:33:9: sparse: sparse: cast truncates bits from constant value (80088 becomes 88)
   arch/x86/kvm/vmx/vmcs12.c:33:9: sparse: sparse: cast truncates bits from constant value (800c8 becomes c8)
   arch/x86/kvm/vmx/vmcs12.c:34:9: sparse: sparse: cast truncates bits from constant value (80108 becomes 108)
   arch/x86/kvm/vmx/vmcs12.c:34:9: sparse: sparse: cast truncates bits from constant value (80148 becomes 148)
   arch/x86/kvm/vmx/vmcs12.c:35:9: sparse: sparse: cast truncates bits from constant value (80188 becomes 188)
   arch/x86/kvm/vmx/vmcs12.c:35:9: sparse: sparse: cast truncates bits from constant value (801c8 becomes 1c8)
   arch/x86/kvm/vmx/vmcs12.c:36:9: sparse: sparse: cast truncates bits from constant value (80208 becomes 208)
   arch/x86/kvm/vmx/vmcs12.c:36:9: sparse: sparse: cast truncates bits from constant value (80248 becomes 248)
   arch/x86/kvm/vmx/vmcs12.c:37:9: sparse: sparse: cast truncates bits from constant value (80288 becomes 288)
   arch/x86/kvm/vmx/vmcs12.c:37:9: sparse: sparse: cast truncates bits from constant value (802c8 becomes 2c8)
   arch/x86/kvm/vmx/vmcs12.c:38:9: sparse: sparse: cast truncates bits from constant value (80388 becomes 388)
   arch/x86/kvm/vmx/vmcs12.c:38:9: sparse: sparse: cast truncates bits from constant value (803c8 becomes 3c8)
   arch/x86/kvm/vmx/vmcs12.c:39:9: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
   arch/x86/kvm/vmx/vmcs12.c:39:9: sparse: sparse: cast truncates bits from constant value (80448 becomes 448)
   arch/x86/kvm/vmx/vmcs12.c:40:9: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/vmcs12.c:40:9: sparse: sparse: cast truncates bits from constant value (80cc8 becomes cc8)
   arch/x86/kvm/vmx/vmcs12.c:41:9: sparse: sparse: cast truncates bits from constant value (80488 becomes 488)
   arch/x86/kvm/vmx/vmcs12.c:41:9: sparse: sparse: cast truncates bits from constant value (804c8 becomes 4c8)
   arch/x86/kvm/vmx/vmcs12.c:42:9: sparse: sparse: cast truncates bits from constant value (80508 becomes 508)
   arch/x86/kvm/vmx/vmcs12.c:42:9: sparse: sparse: cast truncates bits from constant value (80548 becomes 548)
   arch/x86/kvm/vmx/vmcs12.c:43:9: sparse: sparse: cast truncates bits from constant value (80588 becomes 588)
   arch/x86/kvm/vmx/vmcs12.c:43:9: sparse: sparse: cast truncates bits from constant value (805c8 becomes 5c8)
   arch/x86/kvm/vmx/vmcs12.c:44:9: sparse: sparse: cast truncates bits from constant value (80608 becomes 608)
   arch/x86/kvm/vmx/vmcs12.c:44:9: sparse: sparse: cast truncates bits from constant value (80648 becomes 648)
   arch/x86/kvm/vmx/vmcs12.c:45:9: sparse: sparse: cast truncates bits from constant value (80688 becomes 688)
   arch/x86/kvm/vmx/vmcs12.c:45:9: sparse: sparse: cast truncates bits from constant value (806c8 becomes 6c8)
   arch/x86/kvm/vmx/vmcs12.c:46:9: sparse: sparse: cast truncates bits from constant value (80708 becomes 708)
   arch/x86/kvm/vmx/vmcs12.c:46:9: sparse: sparse: cast truncates bits from constant value (80748 becomes 748)
   arch/x86/kvm/vmx/vmcs12.c:47:9: sparse: sparse: cast truncates bits from constant value (80788 becomes 788)
   arch/x86/kvm/vmx/vmcs12.c:47:9: sparse: sparse: cast truncates bits from constant value (807c8 becomes 7c8)
   arch/x86/kvm/vmx/vmcs12.c:48:9: sparse: sparse: cast truncates bits from constant value (80808 becomes 808)
   arch/x86/kvm/vmx/vmcs12.c:48:9: sparse: sparse: cast truncates bits from constant value (80848 becomes 848)
   arch/x86/kvm/vmx/vmcs12.c:49:9: sparse: sparse: cast truncates bits from constant value (80888 becomes 888)
   arch/x86/kvm/vmx/vmcs12.c:49:9: sparse: sparse: cast truncates bits from constant value (808c8 becomes 8c8)
   arch/x86/kvm/vmx/vmcs12.c:50:9: sparse: sparse: cast truncates bits from constant value (80908 becomes 908)
   arch/x86/kvm/vmx/vmcs12.c:50:9: sparse: sparse: cast truncates bits from constant value (80948 becomes 948)
   arch/x86/kvm/vmx/vmcs12.c:51:9: sparse: sparse: cast truncates bits from constant value (80988 becomes 988)
   arch/x86/kvm/vmx/vmcs12.c:51:9: sparse: sparse: cast truncates bits from constant value (809c8 becomes 9c8)
   arch/x86/kvm/vmx/vmcs12.c:52:9: sparse: sparse: cast truncates bits from constant value (80a08 becomes a08)
   arch/x86/kvm/vmx/vmcs12.c:52:9: sparse: sparse: cast truncates bits from constant value (80a48 becomes a48)
   arch/x86/kvm/vmx/vmcs12.c:53:9: sparse: sparse: cast truncates bits from constant value (80b08 becomes b08)
   arch/x86/kvm/vmx/vmcs12.c:53:9: sparse: sparse: cast truncates bits from constant value (80b48 becomes b48)
   arch/x86/kvm/vmx/vmcs12.c:54:9: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
   arch/x86/kvm/vmx/vmcs12.c:54:9: sparse: sparse: cast truncates bits from constant value (80bc8 becomes bc8)
   arch/x86/kvm/vmx/vmcs12.c:55:9: sparse: sparse: cast truncates bits from constant value (90009 becomes 9)
   arch/x86/kvm/vmx/vmcs12.c:55:9: sparse: sparse: cast truncates bits from constant value (90049 becomes 49)
   arch/x86/kvm/vmx/vmcs12.c:56:9: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
   arch/x86/kvm/vmx/vmcs12.c:56:9: sparse: sparse: cast truncates bits from constant value (a004a becomes 4a)
   arch/x86/kvm/vmx/vmcs12.c:57:9: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/vmcs12.c:57:9: sparse: sparse: cast truncates bits from constant value (a00ca becomes ca)
   arch/x86/kvm/vmx/vmcs12.c:58:9: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
   arch/x86/kvm/vmx/vmcs12.c:58:9: sparse: sparse: cast truncates bits from constant value (a014a becomes 14a)
   arch/x86/kvm/vmx/vmcs12.c:59:9: sparse: sparse: cast truncates bits from constant value (a018a becomes 18a)
   arch/x86/kvm/vmx/vmcs12.c:59:9: sparse: sparse: cast truncates bits from constant value (a01ca becomes 1ca)
   arch/x86/kvm/vmx/vmcs12.c:60:9: sparse: sparse: cast truncates bits from constant value (a020a becomes 20a)
   arch/x86/kvm/vmx/vmcs12.c:60:9: sparse: sparse: cast truncates bits from constant value (a024a becomes 24a)
   arch/x86/kvm/vmx/vmcs12.c:61:9: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
   arch/x86/kvm/vmx/vmcs12.c:61:9: sparse: sparse: cast truncates bits from constant value (a02ca becomes 2ca)
   arch/x86/kvm/vmx/vmcs12.c:62:9: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
   arch/x86/kvm/vmx/vmcs12.c:62:9: sparse: sparse: cast truncates bits from constant value (a034a becomes 34a)
   arch/x86/kvm/vmx/vmcs12.c:63:9: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
   arch/x86/kvm/vmx/vmcs12.c:63:9: sparse: sparse: cast truncates bits from constant value (a03ca becomes 3ca)
   arch/x86/kvm/vmx/vmcs12.c:64:9: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/vmcs12.c:64:9: sparse: sparse: cast truncates bits from constant value (a044a becomes 44a)
   arch/x86/kvm/vmx/vmcs12.c:65:9: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/vmcs12.c:65:9: sparse: sparse: cast truncates bits from constant value (a04ca becomes 4ca)
   arch/x86/kvm/vmx/vmcs12.c:66:9: sparse: sparse: cast truncates bits from constant value (b000b becomes b)
   arch/x86/kvm/vmx/vmcs12.c:66:9: sparse: sparse: cast truncates bits from constant value (b004b becomes 4b)
   arch/x86/kvm/vmx/vmcs12.c:67:9: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
   arch/x86/kvm/vmx/vmcs12.c:67:9: sparse: sparse: cast truncates bits from constant value (b00cb becomes cb)
   arch/x86/kvm/vmx/vmcs12.c:68:9: sparse: sparse: cast truncates bits from constant value (b010b becomes 10b)
   arch/x86/kvm/vmx/vmcs12.c:68:9: sparse: sparse: cast truncates bits from constant value (b014b becomes 14b)
   arch/x86/kvm/vmx/vmcs12.c:69:9: sparse: sparse: cast truncates bits from constant value (81108 becomes 1108)
   arch/x86/kvm/vmx/vmcs12.c:69:9: sparse: sparse: cast truncates bits from constant value (81148 becomes 1148)
   arch/x86/kvm/vmx/vmcs12.c:70:9: sparse: sparse: cast truncates bits from constant value (81488 becomes 1488)
>> arch/x86/kvm/vmx/vmcs12.c:70:9: sparse: sparse: cast truncates bits from constant value (814c8 becomes 14c8)
   arch/x86/kvm/vmx/vmcs12.c:71:9: sparse: sparse: cast truncates bits from constant value (90109 becomes 109)
   arch/x86/kvm/vmx/vmcs12.c:71:9: sparse: sparse: cast truncates bits from constant value (90149 becomes 149)
>> arch/x86/kvm/vmx/vmcs12.c:72:9: sparse: sparse: cast truncates bits from constant value (a068a becomes 68a)
>> arch/x86/kvm/vmx/vmcs12.c:72:9: sparse: sparse: cast truncates bits from constant value (a06ca becomes 6ca)
>> arch/x86/kvm/vmx/vmcs12.c:73:9: sparse: sparse: cast truncates bits from constant value (a070a becomes 70a)
>> arch/x86/kvm/vmx/vmcs12.c:73:9: sparse: sparse: cast truncates bits from constant value (a074a becomes 74a)
>> arch/x86/kvm/vmx/vmcs12.c:74:9: sparse: sparse: cast truncates bits from constant value (a078a becomes 78a)
>> arch/x86/kvm/vmx/vmcs12.c:74:9: sparse: sparse: cast truncates bits from constant value (a07ca becomes 7ca)
>> arch/x86/kvm/vmx/vmcs12.c:75:9: sparse: sparse: cast truncates bits from constant value (a080a becomes 80a)
>> arch/x86/kvm/vmx/vmcs12.c:75:9: sparse: sparse: cast truncates bits from constant value (a084a becomes 84a)
>> arch/x86/kvm/vmx/vmcs12.c:76:9: sparse: sparse: cast truncates bits from constant value (a088a becomes 88a)
>> arch/x86/kvm/vmx/vmcs12.c:76:9: sparse: sparse: cast truncates bits from constant value (a08ca becomes 8ca)
>> arch/x86/kvm/vmx/vmcs12.c:77:9: sparse: sparse: cast truncates bits from constant value (a090a becomes 90a)
>> arch/x86/kvm/vmx/vmcs12.c:77:9: sparse: sparse: cast truncates bits from constant value (a094a becomes 94a)
>> arch/x86/kvm/vmx/vmcs12.c:78:9: sparse: sparse: cast truncates bits from constant value (a098a becomes 98a)
>> arch/x86/kvm/vmx/vmcs12.c:78:9: sparse: sparse: cast truncates bits from constant value (a09ca becomes 9ca)
>> arch/x86/kvm/vmx/vmcs12.c:79:9: sparse: sparse: cast truncates bits from constant value (a0a0a becomes a0a)
>> arch/x86/kvm/vmx/vmcs12.c:79:9: sparse: sparse: cast truncates bits from constant value (a0a4a becomes a4a)
>> arch/x86/kvm/vmx/vmcs12.c:80:9: sparse: sparse: cast truncates bits from constant value (b020b becomes 20b)
>> arch/x86/kvm/vmx/vmcs12.c:80:9: sparse: sparse: cast truncates bits from constant value (b024b becomes 24b)
>> arch/x86/kvm/vmx/vmcs12.c:81:9: sparse: sparse: cast truncates bits from constant value (b028b becomes 28b)
>> arch/x86/kvm/vmx/vmcs12.c:81:9: sparse: sparse: cast truncates bits from constant value (b02cb becomes 2cb)
>> arch/x86/kvm/vmx/vmcs12.c:82:9: sparse: sparse: cast truncates bits from constant value (b030b becomes 30b)
>> arch/x86/kvm/vmx/vmcs12.c:82:9: sparse: sparse: cast truncates bits from constant value (b034b becomes 34b)
>> arch/x86/kvm/vmx/vmcs12.c:83:9: sparse: sparse: cast truncates bits from constant value (b038b becomes 38b)
>> arch/x86/kvm/vmx/vmcs12.c:83:9: sparse: sparse: cast truncates bits from constant value (b03cb becomes 3cb)
>> arch/x86/kvm/vmx/vmcs12.c:84:9: sparse: sparse: cast truncates bits from constant value (b040b becomes 40b)
>> arch/x86/kvm/vmx/vmcs12.c:84:9: sparse: sparse: cast truncates bits from constant value (b044b becomes 44b)
>> arch/x86/kvm/vmx/vmcs12.c:85:9: sparse: sparse: cast truncates bits from constant value (b048b becomes 48b)
>> arch/x86/kvm/vmx/vmcs12.c:85:9: sparse: sparse: cast truncates bits from constant value (b04cb becomes 4cb)
>> arch/x86/kvm/vmx/vmcs12.c:86:9: sparse: sparse: cast truncates bits from constant value (b050b becomes 50b)
>> arch/x86/kvm/vmx/vmcs12.c:86:9: sparse: sparse: cast truncates bits from constant value (b054b becomes 54b)
>> arch/x86/kvm/vmx/vmcs12.c:87:9: sparse: sparse: cast truncates bits from constant value (b058b becomes 58b)
>> arch/x86/kvm/vmx/vmcs12.c:87:9: sparse: sparse: cast truncates bits from constant value (b05cb becomes 5cb)
   arch/x86/kvm/vmx/vmcs12.c:88:9: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/vmcs12.c:89:9: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/vmcs12.c:90:9: sparse: sparse: cast truncates bits from constant value (100110 becomes 110)
   arch/x86/kvm/vmx/vmcs12.c:91:9: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/vmcs12.c:92:9: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/vmcs12.c:93:9: sparse: sparse: cast truncates bits from constant value (100290 becomes 290)
   arch/x86/kvm/vmx/vmcs12.c:94:9: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/vmcs12.c:95:9: sparse: sparse: cast truncates bits from constant value (100390 becomes 390)
   arch/x86/kvm/vmx/vmcs12.c:96:9: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/vmcs12.c:97:9: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/vmcs12.c:98:9: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/vmcs12.c:99:9: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/vmcs12.c:100:9: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/vmcs12.c:101:9: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/vmcs12.c:102:9: sparse: sparse: cast truncates bits from constant value (100710 becomes 710)
   arch/x86/kvm/vmx/vmcs12.c:103:9: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/vmcs12.c:104:9: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/vmcs12.c:105:9: sparse: sparse: cast truncates bits from constant value (110091 becomes 91)
   arch/x86/kvm/vmx/vmcs12.c:106:9: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/vmcs12.c:107:9: sparse: sparse: cast truncates bits from constant value (110191 becomes 191)
   arch/x86/kvm/vmx/vmcs12.c:108:9: sparse: sparse: cast truncates bits from constant value (110211 becomes 211)
   arch/x86/kvm/vmx/vmcs12.c:109:9: sparse: sparse: cast truncates bits from constant value (110291 becomes 291)
   arch/x86/kvm/vmx/vmcs12.c:110:9: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/vmcs12.c:111:9: sparse: sparse: cast truncates bits from constant value (110391 becomes 391)
   arch/x86/kvm/vmx/vmcs12.c:112:9: sparse: sparse: cast truncates bits from constant value (120012 becomes 12)
   arch/x86/kvm/vmx/vmcs12.c:113:9: sparse: sparse: cast truncates bits from constant value (120092 becomes 92)
   arch/x86/kvm/vmx/vmcs12.c:114:9: sparse: sparse: cast truncates bits from constant value (120112 becomes 112)
   arch/x86/kvm/vmx/vmcs12.c:115:9: sparse: sparse: cast truncates bits from constant value (120192 becomes 192)
   arch/x86/kvm/vmx/vmcs12.c:116:9: sparse: sparse: cast truncates bits from constant value (120212 becomes 212)
   arch/x86/kvm/vmx/vmcs12.c:117:9: sparse: sparse: cast truncates bits from constant value (120292 becomes 292)
   arch/x86/kvm/vmx/vmcs12.c:118:9: sparse: sparse: cast truncates bits from constant value (120312 becomes 312)
   arch/x86/kvm/vmx/vmcs12.c:119:9: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/vmcs12.c:120:9: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/vmcs12.c:121:9: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/vmcs12.c:122:9: sparse: sparse: cast truncates bits from constant value (120512 becomes 512)
   arch/x86/kvm/vmx/vmcs12.c:123:9: sparse: sparse: cast truncates bits from constant value (120592 becomes 592)
   arch/x86/kvm/vmx/vmcs12.c:124:9: sparse: sparse: cast truncates bits from constant value (120612 becomes 612)
   arch/x86/kvm/vmx/vmcs12.c:125:9: sparse: sparse: cast truncates bits from constant value (120692 becomes 692)
   arch/x86/kvm/vmx/vmcs12.c:126:9: sparse: sparse: cast truncates bits from constant value (120712 becomes 712)
   arch/x86/kvm/vmx/vmcs12.c:127:9: sparse: sparse: cast truncates bits from constant value (120792 becomes 792)
   arch/x86/kvm/vmx/vmcs12.c:128:9: sparse: sparse: cast truncates bits from constant value (120812 becomes 812)
   arch/x86/kvm/vmx/vmcs12.c:129:9: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/vmcs12.c:130:9: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/vmcs12.c:131:9: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/vmcs12.c:132:9: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/vmcs12.c:133:9: sparse: sparse: cast truncates bits from constant value (130013 becomes 13)
   arch/x86/kvm/vmx/vmcs12.c:134:9: sparse: sparse: cast truncates bits from constant value (120b92 becomes b92)
   arch/x86/kvm/vmx/vmcs12.c:135:9: sparse: sparse: cast truncates bits from constant value (180018 becomes 18)
   arch/x86/kvm/vmx/vmcs12.c:136:9: sparse: sparse: cast truncates bits from constant value (180098 becomes 98)
   arch/x86/kvm/vmx/vmcs12.c:137:9: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
   arch/x86/kvm/vmx/vmcs12.c:138:9: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
   arch/x86/kvm/vmx/vmcs12.c:139:9: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/vmcs12.c:140:9: sparse: sparse: cast truncates bits from constant value (190299 becomes 299)
   arch/x86/kvm/vmx/vmcs12.c:141:9: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
   arch/x86/kvm/vmx/vmcs12.c:142:9: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
   arch/x86/kvm/vmx/vmcs12.c:143:9: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/vmcs12.c:144:9: sparse: sparse: cast truncates bits from constant value (1a019a becomes 19a)
   arch/x86/kvm/vmx/vmcs12.c:145:9: sparse: sparse: cast truncates bits from constant value (1a021a becomes 21a)
   arch/x86/kvm/vmx/vmcs12.c:146:9: sparse: sparse: cast truncates bits from constant value (1a029a becomes 29a)
   arch/x86/kvm/vmx/vmcs12.c:147:9: sparse: sparse: cast truncates bits from constant value (1a031a becomes 31a)
   arch/x86/kvm/vmx/vmcs12.c:148:9: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
   arch/x86/kvm/vmx/vmcs12.c:149:9: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
   arch/x86/kvm/vmx/vmcs12.c:150:9: sparse: sparse: cast truncates bits from constant value (1a049a becomes 49a)
   arch/x86/kvm/vmx/vmcs12.c:151:9: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
   arch/x86/kvm/vmx/vmcs12.c:152:9: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
   arch/x86/kvm/vmx/vmcs12.c:153:9: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/vmcs12.c:154:9: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
   arch/x86/kvm/vmx/vmcs12.c:155:9: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
   arch/x86/kvm/vmx/vmcs12.c:156:9: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
   arch/x86/kvm/vmx/vmcs12.c:157:9: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/vmcs12.c:158:9: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
   arch/x86/kvm/vmx/vmcs12.c:159:9: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/vmcs12.c:160:9: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/vmcs12.c:161:9: sparse: sparse: cast truncates bits from constant value (1a0a1a becomes a1a)
   arch/x86/kvm/vmx/vmcs12.c:162:9: sparse: sparse: cast truncates bits from constant value (1a0a9a becomes a9a)
   arch/x86/kvm/vmx/vmcs12.c:163:9: sparse: sparse: cast truncates bits from constant value (1a0b1a becomes b1a)
   arch/x86/kvm/vmx/vmcs12.c:164:9: sparse: sparse: cast truncates bits from constant value (1b001b becomes 1b)
   arch/x86/kvm/vmx/vmcs12.c:165:9: sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
   arch/x86/kvm/vmx/vmcs12.c:166:9: sparse: sparse: cast truncates bits from constant value (1b011b becomes 11b)
   arch/x86/kvm/vmx/vmcs12.c:167:9: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
   arch/x86/kvm/vmx/vmcs12.c:168:9: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
   arch/x86/kvm/vmx/vmcs12.c:169:9: sparse: sparse: cast truncates bits from constant value (1b029b becomes 29b)
   arch/x86/kvm/vmx/vmcs12.c:170:9: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
   arch/x86/kvm/vmx/vmcs12.c:171:9: sparse: sparse: cast truncates bits from constant value (1b039b becomes 39b)
   arch/x86/kvm/vmx/vmcs12.c:172:9: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
   arch/x86/kvm/vmx/vmcs12.c:173:9: sparse: sparse: cast truncates bits from constant value (1b049b becomes 49b)
   arch/x86/kvm/vmx/vmcs12.c:174:9: sparse: sparse: cast truncates bits from constant value (1b051b becomes 51b)
   arch/x86/kvm/vmx/vmcs12.c:175:9: sparse: sparse: cast truncates bits from constant value (1b059b becomes 59b)
   arch/x86/kvm/vmx/vmcs12.c:176:9: sparse: sparse: cast truncates bits from constant value (1b061b becomes 61b)
   arch/x86/kvm/vmx/vmcs12.c:177:9: sparse: sparse: cast truncates bits from constant value (1b069b becomes 69b)
   arch/x86/kvm/vmx/vmcs12.c:178:9: sparse: sparse: cast truncates bits from constant value (1b071b becomes 71b)

vim +70 arch/x86/kvm/vmx/vmcs12.c

     5	
     6	#define VMCS12_OFFSET(x) offsetof(struct vmcs12, x)
     7	#define FIELD(number, name)	[ROL16(number, 6)] = VMCS12_OFFSET(name)
     8	#define FIELD64(number, name)						\
     9		FIELD(number, name),						\
    10		[ROL16(number##_HIGH, 6)] = VMCS12_OFFSET(name) + sizeof(u32)
    11	
    12	const unsigned short vmcs12_field_offsets[] = {
    13		FIELD(VIRTUAL_PROCESSOR_ID, virtual_processor_id),
    14		FIELD(POSTED_INTR_NV, posted_intr_nv),
    15		FIELD(GUEST_ES_SELECTOR, guest_es_selector),
    16		FIELD(GUEST_CS_SELECTOR, guest_cs_selector),
    17		FIELD(GUEST_SS_SELECTOR, guest_ss_selector),
    18		FIELD(GUEST_DS_SELECTOR, guest_ds_selector),
    19		FIELD(GUEST_FS_SELECTOR, guest_fs_selector),
    20		FIELD(GUEST_GS_SELECTOR, guest_gs_selector),
    21		FIELD(GUEST_LDTR_SELECTOR, guest_ldtr_selector),
    22		FIELD(GUEST_TR_SELECTOR, guest_tr_selector),
    23		FIELD(GUEST_INTR_STATUS, guest_intr_status),
    24		FIELD(GUEST_PML_INDEX, guest_pml_index),
    25		FIELD(HOST_ES_SELECTOR, host_es_selector),
    26		FIELD(HOST_CS_SELECTOR, host_cs_selector),
    27		FIELD(HOST_SS_SELECTOR, host_ss_selector),
    28		FIELD(HOST_DS_SELECTOR, host_ds_selector),
    29		FIELD(HOST_FS_SELECTOR, host_fs_selector),
    30		FIELD(HOST_GS_SELECTOR, host_gs_selector),
    31		FIELD(HOST_TR_SELECTOR, host_tr_selector),
    32		FIELD64(IO_BITMAP_A, io_bitmap_a),
    33		FIELD64(IO_BITMAP_B, io_bitmap_b),
    34		FIELD64(MSR_BITMAP, msr_bitmap),
    35		FIELD64(VM_EXIT_MSR_STORE_ADDR, vm_exit_msr_store_addr),
    36		FIELD64(VM_EXIT_MSR_LOAD_ADDR, vm_exit_msr_load_addr),
    37		FIELD64(VM_ENTRY_MSR_LOAD_ADDR, vm_entry_msr_load_addr),
    38		FIELD64(PML_ADDRESS, pml_address),
    39		FIELD64(TSC_OFFSET, tsc_offset),
    40		FIELD64(TSC_MULTIPLIER, tsc_multiplier),
    41		FIELD64(VIRTUAL_APIC_PAGE_ADDR, virtual_apic_page_addr),
    42		FIELD64(APIC_ACCESS_ADDR, apic_access_addr),
    43		FIELD64(POSTED_INTR_DESC_ADDR, posted_intr_desc_addr),
    44		FIELD64(VM_FUNCTION_CONTROL, vm_function_control),
    45		FIELD64(EPT_POINTER, ept_pointer),
    46		FIELD64(EOI_EXIT_BITMAP0, eoi_exit_bitmap0),
    47		FIELD64(EOI_EXIT_BITMAP1, eoi_exit_bitmap1),
    48		FIELD64(EOI_EXIT_BITMAP2, eoi_exit_bitmap2),
    49		FIELD64(EOI_EXIT_BITMAP3, eoi_exit_bitmap3),
    50		FIELD64(EPTP_LIST_ADDRESS, eptp_list_address),
    51		FIELD64(VMREAD_BITMAP, vmread_bitmap),
    52		FIELD64(VMWRITE_BITMAP, vmwrite_bitmap),
    53		FIELD64(XSS_EXIT_BITMAP, xss_exit_bitmap),
    54		FIELD64(ENCLS_EXITING_BITMAP, encls_exiting_bitmap),
    55		FIELD64(GUEST_PHYSICAL_ADDRESS, guest_physical_address),
    56		FIELD64(VMCS_LINK_POINTER, vmcs_link_pointer),
    57		FIELD64(GUEST_IA32_DEBUGCTL, guest_ia32_debugctl),
    58		FIELD64(GUEST_IA32_PAT, guest_ia32_pat),
    59		FIELD64(GUEST_IA32_EFER, guest_ia32_efer),
    60		FIELD64(GUEST_IA32_PERF_GLOBAL_CTRL, guest_ia32_perf_global_ctrl),
    61		FIELD64(GUEST_PDPTR0, guest_pdptr0),
    62		FIELD64(GUEST_PDPTR1, guest_pdptr1),
    63		FIELD64(GUEST_PDPTR2, guest_pdptr2),
    64		FIELD64(GUEST_PDPTR3, guest_pdptr3),
    65		FIELD64(GUEST_BNDCFGS, guest_bndcfgs),
    66		FIELD64(HOST_IA32_PAT, host_ia32_pat),
    67		FIELD64(HOST_IA32_EFER, host_ia32_efer),
    68		FIELD64(HOST_IA32_PERF_GLOBAL_CTRL, host_ia32_perf_global_ctrl),
    69		FIELD64(SECONDARY_VM_EXIT_CONTROLS, secondary_vm_exit_controls),
  > 70		FIELD64(INJECTED_EVENT_DATA, injected_event_data),
    71		FIELD64(ORIGINAL_EVENT_DATA, original_event_data),
  > 72		FIELD64(GUEST_IA32_FRED_CONFIG, guest_ia32_fred_config),
  > 73		FIELD64(GUEST_IA32_FRED_RSP1, guest_ia32_fred_rsp1),
  > 74		FIELD64(GUEST_IA32_FRED_RSP2, guest_ia32_fred_rsp2),
  > 75		FIELD64(GUEST_IA32_FRED_RSP3, guest_ia32_fred_rsp3),
  > 76		FIELD64(GUEST_IA32_FRED_STKLVLS, guest_ia32_fred_stklvls),
  > 77		FIELD64(GUEST_IA32_FRED_SSP1, guest_ia32_fred_ssp1),
  > 78		FIELD64(GUEST_IA32_FRED_SSP2, guest_ia32_fred_ssp2),
  > 79		FIELD64(GUEST_IA32_FRED_SSP3, guest_ia32_fred_ssp3),
  > 80		FIELD64(HOST_IA32_FRED_CONFIG, host_ia32_fred_config),
  > 81		FIELD64(HOST_IA32_FRED_RSP1, host_ia32_fred_rsp1),
  > 82		FIELD64(HOST_IA32_FRED_RSP2, host_ia32_fred_rsp2),
  > 83		FIELD64(HOST_IA32_FRED_RSP3, host_ia32_fred_rsp3),
  > 84		FIELD64(HOST_IA32_FRED_STKLVLS, host_ia32_fred_stklvls),
  > 85		FIELD64(HOST_IA32_FRED_SSP1, host_ia32_fred_ssp1),
  > 86		FIELD64(HOST_IA32_FRED_SSP2, host_ia32_fred_ssp2),
  > 87		FIELD64(HOST_IA32_FRED_SSP3, host_ia32_fred_ssp3),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
