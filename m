Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51472673A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753709824; cv=none; b=gI2XvIycfY53sYM5NpvbIfdjWpYceA2fHjCCVdd23GAv+alPZglbV7ct8rLc0PHLlDF4uS3xLmA25oLYK8dp41o7zsZmnbs8uvs7zOb1heqB6S5F8suOJoqgTUNr3TmzQ4yUg2sVQFGQyh9nZtsozBMrPL5YpvU3CFLxQ7U9O4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753709824; c=relaxed/simple;
	bh=6deyqEEPrLelT+xXLWnOu3SVjq1yLHAYFlhtwnH8zl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GLAqiKEPZlQ1OQLcK8Sc7L47M2C9xE9AyRo3fZbrTJk/JAl0yJRvvwGBWokbnHp3p87HkBSkE1PycLRNVKwR5Or3BOAHK2MxXREKU1eYaIVBFdYpwibYwaM1BbthSbOiVPYF1B1r/s3KQ5NEz0OfJ3sWdJfR0lDqUvqvFNzvzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yik7oQNL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yik7oQNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753709823; x=1785245823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6deyqEEPrLelT+xXLWnOu3SVjq1yLHAYFlhtwnH8zl8=;
  b=Yik7oQNLWaMi5iDqqWNe8Ud7KkrEZml/VPMxwsdEKPLpk7mt5aalj8Jg
   6+wjwgZJSjZ5Dfpq273IXy4IC+DO7+t9trU8zmQumcbU39zhcBiBvGPb/
   9XWvyE0ZeQlGjHnPlyw45Weh/rwfpGz1s0dL3jiNAbb17g3ppXPdKF9eR
   8Km90oBgyX/59BI5BlK6XktxW7I0S5IqSXWJQHHv4u0nE82TJESOlI6Bg
   vPDBt4jQekDoZMjJu6JgqPmXMaxtww3A0JX1E2i8DYPIhk0X7kVt8hxTi
   VSRUTL/Qj6eFpfarDAdRGgSmy6hWII9PygbcocGxku10sgQ844TMqtIAj
   w==;
X-CSE-ConnectionGUID: z2G8umhcStqdJA6spARZCA==
X-CSE-MsgGUID: MeRg6/T3RY61a2Jq6dQFRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59776945"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="59776945"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 06:37:02 -0700
X-CSE-ConnectionGUID: iLvREM39S52Ks8wYwdcm4A==
X-CSE-MsgGUID: OfB16Jj5TqaEahoIqo604Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162747731"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jul 2025 06:37:01 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugO2E-0000Tb-2c;
	Mon, 28 Jul 2025 13:36:58 +0000
Date: Mon, 28 Jul 2025 21:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [linux-next:master 12112/12680] arp_tables.c:undefined reference to
 `xt_recseq'
Message-ID: <202507282103.XJ3hBMdC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b90c3b6d76ea512dc3dac8fb30215e175b0019a
commit: 9fce66583f06c212e95e4b76dd61d8432ffa56b6 [12112/12680] netfilter: Exclude LEGACY TABLES on PREEMPT_RT.
config: xtensa-randconfig-002-20250727 (https://download.01.org/0day-ci/archive/20250728/202507282103.XJ3hBMdC-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507282103.XJ3hBMdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507282103.XJ3hBMdC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o:(.init.literal+0x4): undefined reference to `xt_proto_init'
>> xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o:(.init.literal+0x20): undefined reference to `xt_register_targets'
>> xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o:(.init.literal+0x30): undefined reference to `xt_unregister_targets'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `copy_from_sockptr_offset':
>> arp_tables.c:(.text+0x2664): undefined reference to `xt_recseq'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arp_packet_match':
   arp_tables.c:(.text+0x1170): undefined reference to `xt_recseq'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_alloc_initial_table':
   arp_tables.c:(.text+0x4a0): undefined reference to `xt_recseq'
>> xtensa-linux-ld: arp_tables.c:(.text+0x498): undefined reference to `xt_recseq'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `pskb_may_pull_reason':
>> arp_tables.c:(.text+0x12c): undefined reference to `xt_percpu_counter_free'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `cleanup_entry':
   arp_tables.c:(.text+0x183): undefined reference to `xt_percpu_counter_free'
>> xtensa-linux-ld: arp_tables.c:(.text+0x19c): undefined reference to `xt_unregister_table'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `__arpt_unregister_table':
>> arp_tables.c:(.text+0x1d8): undefined reference to `xt_unregister_table'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `cleanup_entry':
>> arp_tables.c:(.text+0x1b4): undefined reference to `xt_free_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `__arpt_unregister_table':
   arp_tables.c:(.text+0x228): undefined reference to `xt_free_table_info'
>> xtensa-linux-ld: arp_tables.c:(.text+0x244): undefined reference to `xt_find_table'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_unregister_table':
>> arp_tables.c:(.text+0x26a): undefined reference to `xt_find_table'
   xtensa-linux-ld: arp_tables.c:(.text+0x298): undefined reference to `xt_find_table'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_unregister_table_pre_exit':
   arp_tables.c:(.text+0x2c6): undefined reference to `xt_find_table'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `get_counters':
>> arp_tables.c:(.text+0x720): undefined reference to `xt_find_jump_offset'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `mark_source_chains':
   arp_tables.c:(.text+0x8b6): undefined reference to `xt_find_jump_offset'
>> xtensa-linux-ld: arp_tables.c:(.text+0x994): undefined reference to `xt_counters_alloc'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `__do_replace.constprop.0':
>> arp_tables.c:(.text+0xab3): undefined reference to `xt_counters_alloc'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `mark_source_chains':
>> arp_tables.c:(.text+0x9a0): undefined reference to `xt_request_find_table_lock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `__do_replace.constprop.0':
   arp_tables.c:(.text+0xada): undefined reference to `xt_request_find_table_lock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `mark_source_chains':
>> arp_tables.c:(.text+0x9b8): undefined reference to `xt_replace_table'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `__do_replace.constprop.0':
   arp_tables.c:(.text+0xb33): undefined reference to `xt_replace_table'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `mark_source_chains':
>> arp_tables.c:(.text+0x9dc): undefined reference to `xt_table_unlock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `__do_replace.constprop.0':
   arp_tables.c:(.text+0xb9e): undefined reference to `xt_table_unlock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `mark_source_chains':
   arp_tables.c:(.text+0x9f0): undefined reference to `xt_free_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `__do_replace.constprop.0':
   arp_tables.c:(.text+0xc3e): undefined reference to `xt_free_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `mark_source_chains':
   arp_tables.c:(.text+0xa58): undefined reference to `xt_table_unlock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `__do_replace.constprop.0':
   arp_tables.c:(.text+0xd98): undefined reference to `xt_table_unlock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_do_table':
>> arp_tables.c:(.text+0x1514): undefined reference to `xt_alloc_entry_offsets'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x162f): undefined reference to `xt_alloc_entry_offsets'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_do_table':
>> arp_tables.c:(.text+0x153c): undefined reference to `xt_check_entry_offsets'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x1703): undefined reference to `xt_check_entry_offsets'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_do_table':
>> arp_tables.c:(.text+0x1588): undefined reference to `xt_check_table_hooks'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x188c): undefined reference to `xt_check_table_hooks'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_do_table':
   arp_tables.c:(.text+0x15a0): undefined reference to `xt_percpu_counter_alloc'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x18ee): undefined reference to `xt_percpu_counter_alloc'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_do_table':
   arp_tables.c:(.text+0x15a8): undefined reference to `xt_request_find_target'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x190b): undefined reference to `xt_request_find_target'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_do_table':
   arp_tables.c:(.text+0x15b4): undefined reference to `xt_percpu_counter_free'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x1938): undefined reference to `xt_percpu_counter_free'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_do_table':
   arp_tables.c:(.text+0x15c0): undefined reference to `xt_check_target'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x1984): undefined reference to `xt_check_target'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_do_table':
   arp_tables.c:(.text+0x15cc): undefined reference to `xt_percpu_counter_free'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x19a2): undefined reference to `xt_percpu_counter_free'
   xtensa-linux-ld: arp_tables.c:(.text+0x1a90): undefined reference to `xt_alloc_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_register_table':
   arp_tables.c:(.text+0x1b14): undefined reference to `xt_alloc_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x1aa0): undefined reference to `xt_free_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_register_table':
   arp_tables.c:(.text+0x1b4c): undefined reference to `xt_free_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x1aa8): undefined reference to `xt_register_table'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_register_table':
   arp_tables.c:(.text+0x1b66): undefined reference to `xt_register_table'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x1abc): undefined reference to `xt_free_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_register_table':
   arp_tables.c:(.text+0x1bc2): undefined reference to `xt_free_table_info'
   xtensa-linux-ld: arp_tables.c:(.text+0x1d10): undefined reference to `xt_target_to_user'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `copy_entries_to_user.isra.0':
   arp_tables.c:(.text+0x1ef3): undefined reference to `xt_target_to_user'
   xtensa-linux-ld: arp_tables.c:(.text+0x1fd0): undefined reference to `xt_request_find_table_lock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `get_info.constprop.0':
   arp_tables.c:(.text+0x215e): undefined reference to `xt_request_find_table_lock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `copy_entries_to_user.isra.0':
   arp_tables.c:(.text+0x2020): undefined reference to `xt_table_unlock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `get_info.constprop.0':
   arp_tables.c:(.text+0x2284): undefined reference to `xt_table_unlock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `copy_from_sockptr_offset':
   arp_tables.c:(.text+0x2690): undefined reference to `xt_alloc_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_set_ctl':
   arp_tables.c:(.text+0x27d3): undefined reference to `xt_alloc_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `copy_from_sockptr_offset':
   arp_tables.c:(.text+0x26ac): undefined reference to `xt_free_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_set_ctl':
   arp_tables.c:(.text+0x2860): undefined reference to `xt_free_table_info'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `copy_from_sockptr_offset':
   arp_tables.c:(.text+0x26b4): undefined reference to `xt_copy_counters'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_set_ctl':
   arp_tables.c:(.text+0x288a): undefined reference to `xt_copy_counters'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `copy_from_sockptr_offset':
   arp_tables.c:(.text+0x26c4): undefined reference to `xt_find_table_lock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_set_ctl':
   arp_tables.c:(.text+0x28cb): undefined reference to `xt_find_table_lock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `copy_from_sockptr_offset':
   arp_tables.c:(.text+0x26ec): undefined reference to `xt_table_unlock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_set_ctl':
   arp_tables.c:(.text+0x29d8): undefined reference to `xt_table_unlock'
   xtensa-linux-ld: arp_tables.c:(.text+0x2aac): undefined reference to `xt_find_table_lock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_get_ctl':
   arp_tables.c:(.text+0x2cb8): undefined reference to `xt_find_table_lock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_set_ctl':
   arp_tables.c:(.text+0x2ac4): undefined reference to `xt_table_unlock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_get_ctl':
   arp_tables.c:(.text+0x2d14): undefined reference to `xt_table_unlock'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_set_ctl':
   arp_tables.c:(.text+0x2b10): undefined reference to `xt_find_revision'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_get_ctl':
   arp_tables.c:(.text+0x2e1a): undefined reference to `xt_find_revision'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_set_ctl':
   arp_tables.c:(.text+0x2b2c): undefined reference to `xt_find_revision'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_get_ctl':
   arp_tables.c:(.text+0x2e74): undefined reference to `xt_find_revision'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o:(.ref.text+0x4): undefined reference to `xt_proto_fini'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arp_tables_net_exit':
   arp_tables.c:(.ref.text+0x1a): undefined reference to `xt_proto_fini'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arp_tables_net_init':
   arp_tables.c:(.init.text+0x12): undefined reference to `xt_proto_init'
   xtensa-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arp_tables_init':
   arp_tables.c:(.init.text+0x4f): undefined reference to `xt_register_targets'
   xtensa-linux-ld: arp_tables.c:(.init.text+0x7a): undefined reference to `xt_unregister_targets'
   xtensa-linux-ld: net/ipv4/netfilter/arptable_filter.o:(.init.literal+0x20): undefined reference to `xt_register_template'
   xtensa-linux-ld: net/ipv4/netfilter/arptable_filter.o:(.init.literal+0x28): undefined reference to `xt_hook_ops_alloc'
   xtensa-linux-ld: net/ipv4/netfilter/arptable_filter.o:(.init.literal+0x34): undefined reference to `xt_unregister_template'
   xtensa-linux-ld: net/ipv4/netfilter/arptable_filter.o:(.init.literal+0x44): undefined reference to `xt_unregister_template'
   xtensa-linux-ld: net/ipv4/netfilter/arptable_filter.o: in function `arptable_filter_init':
   arptable_filter.c:(.init.text+0x1a): undefined reference to `xt_register_template'
   xtensa-linux-ld: arptable_filter.c:(.init.text+0x32): undefined reference to `xt_hook_ops_alloc'
   xtensa-linux-ld: arptable_filter.c:(.init.text+0x66): undefined reference to `xt_unregister_template'
   xtensa-linux-ld: arptable_filter.c:(.init.text+0x8e): undefined reference to `xt_unregister_template'
   xtensa-linux-ld: net/ipv6/netfilter/ip6_tables.o:(.init.literal+0x4): undefined reference to `xt_proto_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
