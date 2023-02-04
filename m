Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D578D525
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 18:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675534795; x=1707070795;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2GDxkFYn93/rks4wPI+LwaTvlwQE9vZrMGJKMdLHfks=;
  b=ZzooYq/55MJflxLQSGgCuwI6s4mynaG74z4C93U+yiPfV6badi6uriVZ
   AlRBI8oOXW5Kj1+nJP3mG/zx4oyM7Wgfit7AwAlVd2M9YR2qIzDV+yQ0W
   KtSLV52TI5mI9k9QGoQFl/aFuZF4Nw9yDpWhj+rRvw7pZnJa87kGPonPE
   7Hq9nMo2PMFy0kCp3JjFCIR19YSRtc0LeWaVXazuWDoJTnOAnMTLlczLh
   9+W2LkIctjsGV6JyVTzvLfXTL6BPQFOcEAR/I3UraSINbcvvZLNyK1JiS
   zk/Z4haIfO+Q/Llvwhr9ymahHevCJ+bFqc5Oc3aeoIFPi7Juj6gEP9Rcu
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="308609480"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="308609480"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 10:19:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="729601154"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="729601154"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Feb 2023 10:19:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pON8j-0001To-05;
	Sat, 04 Feb 2023 18:19:53 +0000
Date: Sun, 05 Feb 2023 02:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+108 bytes kernel size regression] [i386-tinyconfig]
 [26044aff37] x86/crash: Disable virt in core NMI crash handler to avoid
 double shootdown
Message-ID: <63dea197.lXkSkr7qAMYKNjHp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +108 bytes kernel size regression due to commit:

commit: 26044aff37a5455b19a91785086914fd33053ef4 (x86/crash: Disable virt in core NMI crash handler to avoid double shootdown)
https://github.com/sean-jc/linux x86/selftests_unified_hypercall


Details as below (size data is obtained by `nm --size-sort vmlinux`):

f422f853: KVM: x86/xen: update Xen CPUID Leaf 4 (tsc info) sub-leaves, if present
26044aff: x86/crash: Disable virt in core NMI crash handler to avoid double shootdown

+-------------------------------------------+----------+----------+-------+
|                  symbol                   | f422f853 | 26044aff | delta |
+-------------------------------------------+----------+----------+-------+
| bzImage                                   | 495776   | 495872   | 96    |
| nm.T.cpu_emergency_disable_virtualization | 0        | 90       | 90    |
| nm.t.cpu_has_vmx                          | 0        | 20       | 20    |
| nm.t.__cpu_emergency_vmxoff               | 0        | 17       | 17    |
| nm.t.native_machine_emergency_restart     | 325      | 306      | -19   |
+-------------------------------------------+----------+----------+-------+



Thanks

