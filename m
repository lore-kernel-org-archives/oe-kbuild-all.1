Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0144E14AB5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685450846; x=1716986846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lx9aaqR85nG917px1Wz0GFCgvMDsDE4SVc8WotUYZx0=;
  b=jOAAcgJEdM03ZqDZmkEHrC51bqDu1xOESBbeZTGmZaPDz6OB3wWXe2Uv
   WEwZaoL06xVki8e/33FVRh40rvqLFhQwGUYtnxMIxyGrGcaFhZulsOgcq
   K7oLQ5CC20ok7zss9lihEGz6q3rOI4qaTzlkgSptnO5tERivFco8Hk8b0
   aYgcHpGWyR15d8vCU5KUOPYjgX4bcGtw0hgQ9OgeB10hS31qH+qdDRSCO
   rRm/leQykl0rO6t1iHLku7cfjmDXk2OSFNqgGGUw6bZw0gmHeHREwQBUu
   RPIetItE+jgoe9db+p1Ey2ia04l/hzJ2wmIGMj9Zp9H3UDqlVzaa63BDI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353743304"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="353743304"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 05:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="683948596"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="683948596"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 May 2023 05:47:21 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3ykz-0000Yr-0w;
	Tue, 30 May 2023 12:47:21 +0000
Date: Tue, 30 May 2023 20:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [kvm-x86:selftests 1/3] make[1]: *** No rule to make target
 'kselftest/kvm/x86_64/cpuid_test.c', needed by
 'kselftest/kvm/x86_64/cpuid_test.o'.
Message-ID: <202305302015.D8PglEU7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

First bad commit (maybe != root cause):

tree:   https://github.com/kvm-x86/linux selftests
head:   a985a858acff64afaa5cf60e058357034cb14476
commit: 954c9c3f96698f3af0c22f93a68e3905bc185458 [1/3] KVM: selftests: Add new CFLAGS to generate dependency files
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # https://github.com/kvm-x86/linux/commit/954c9c3f96698f3af0c22f93a68e3905bc185458
        git remote add kvm-x86 https://github.com/kvm-x86/linux
        git fetch --no-tags kvm-x86 selftests
        git checkout 954c9c3f96698f3af0c22f93a68e3905bc185458
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305302015.D8PglEU7-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile:89: *** Cannot find a vmlinux for VMLINUX_BTF at any of "vmlinux vmlinux ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/cpuid_test.c', needed by 'kselftest/kvm/x86_64/cpuid_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/cr4_cpuid_sync_test.c', needed by 'kselftest/kvm/x86_64/cr4_cpuid_sync_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/get_msr_index_features.c', needed by 'kselftest/kvm/x86_64/get_msr_index_features.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/exit_on_emulation_failure_test.c', needed by 'kselftest/kvm/x86_64/exit_on_emulation_failure_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/fix_hypercall_test.c', needed by 'kselftest/kvm/x86_64/fix_hypercall_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/hyperv_clock.c', needed by 'kselftest/kvm/x86_64/hyperv_clock.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/hyperv_cpuid.c', needed by 'kselftest/kvm/x86_64/hyperv_cpuid.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/hyperv_evmcs.c', needed by 'kselftest/kvm/x86_64/hyperv_evmcs.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/hyperv_extended_hypercalls.c', needed by 'kselftest/kvm/x86_64/hyperv_extended_hypercalls.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/hyperv_features.c', needed by 'kselftest/kvm/x86_64/hyperv_features.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/hyperv_ipi.c', needed by 'kselftest/kvm/x86_64/hyperv_ipi.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/hyperv_svm_test.c', needed by 'kselftest/kvm/x86_64/hyperv_svm_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/hyperv_tlb_flush.c', needed by 'kselftest/kvm/x86_64/hyperv_tlb_flush.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/kvm_clock_test.c', needed by 'kselftest/kvm/x86_64/kvm_clock_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/kvm_pv_test.c', needed by 'kselftest/kvm/x86_64/kvm_pv_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/mmio_warning_test.c', needed by 'kselftest/kvm/x86_64/mmio_warning_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/monitor_mwait_test.c', needed by 'kselftest/kvm/x86_64/monitor_mwait_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/nested_exceptions_test.c', needed by 'kselftest/kvm/x86_64/nested_exceptions_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/platform_info_test.c', needed by 'kselftest/kvm/x86_64/platform_info_test.o'.
>> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/pmu_event_filter_test.c', needed by 'kselftest/kvm/x86_64/pmu_event_filter_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/set_boot_cpu_id.c', needed by 'kselftest/kvm/x86_64/set_boot_cpu_id.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/set_sregs_test.c', needed by 'kselftest/kvm/x86_64/set_sregs_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/smaller_maxphyaddr_emulation_test.c', needed by 'kselftest/kvm/x86_64/smaller_maxphyaddr_emulation_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/smm_test.c', needed by 'kselftest/kvm/x86_64/smm_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/state_test.c', needed by 'kselftest/kvm/x86_64/state_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_preemption_timer_test.c', needed by 'kselftest/kvm/x86_64/vmx_preemption_timer_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/svm_vmcall_test.c', needed by 'kselftest/kvm/x86_64/svm_vmcall_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/svm_int_ctl_test.c', needed by 'kselftest/kvm/x86_64/svm_int_ctl_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/svm_nested_shutdown_test.c', needed by 'kselftest/kvm/x86_64/svm_nested_shutdown_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/svm_nested_soft_inject_test.c', needed by 'kselftest/kvm/x86_64/svm_nested_soft_inject_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/tsc_scaling_sync.c', needed by 'kselftest/kvm/x86_64/tsc_scaling_sync.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/sync_regs_test.c', needed by 'kselftest/kvm/x86_64/sync_regs_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/ucna_injection_test.c', needed by 'kselftest/kvm/x86_64/ucna_injection_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/userspace_io_test.c', needed by 'kselftest/kvm/x86_64/userspace_io_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/userspace_msr_exit_test.c', needed by 'kselftest/kvm/x86_64/userspace_msr_exit_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_apic_access_test.c', needed by 'kselftest/kvm/x86_64/vmx_apic_access_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_close_while_nested_test.c', needed by 'kselftest/kvm/x86_64/vmx_close_while_nested_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_dirty_log_test.c', needed by 'kselftest/kvm/x86_64/vmx_dirty_log_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_exception_with_invalid_guest_state.c', needed by 'kselftest/kvm/x86_64/vmx_exception_with_invalid_guest_state.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_msrs_test.c', needed by 'kselftest/kvm/x86_64/vmx_msrs_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_invalid_nested_guest_state.c', needed by 'kselftest/kvm/x86_64/vmx_invalid_nested_guest_state.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_set_nested_state_test.c', needed by 'kselftest/kvm/x86_64/vmx_set_nested_state_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_tsc_adjust_test.c', needed by 'kselftest/kvm/x86_64/vmx_tsc_adjust_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_nested_tsc_scaling_test.c', needed by 'kselftest/kvm/x86_64/vmx_nested_tsc_scaling_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/xapic_ipi_test.c', needed by 'kselftest/kvm/x86_64/xapic_ipi_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/xapic_state_test.c', needed by 'kselftest/kvm/x86_64/xapic_state_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/xcr0_cpuid_test.c', needed by 'kselftest/kvm/x86_64/xcr0_cpuid_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/xss_msr_test.c', needed by 'kselftest/kvm/x86_64/xss_msr_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/debug_regs.c', needed by 'kselftest/kvm/x86_64/debug_regs.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/tsc_msrs_test.c', needed by 'kselftest/kvm/x86_64/tsc_msrs_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/vmx_pmu_caps_test.c', needed by 'kselftest/kvm/x86_64/vmx_pmu_caps_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/xen_shinfo_test.c', needed by 'kselftest/kvm/x86_64/xen_shinfo_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/xen_vmcall_test.c', needed by 'kselftest/kvm/x86_64/xen_vmcall_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/sev_migrate_tests.c', needed by 'kselftest/kvm/x86_64/sev_migrate_tests.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/amx_test.c', needed by 'kselftest/kvm/x86_64/amx_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/max_vcpuid_cap_test.c', needed by 'kselftest/kvm/x86_64/max_vcpuid_cap_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/triple_fault_event_test.c', needed by 'kselftest/kvm/x86_64/triple_fault_event_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/access_tracking_perf_test.c', needed by 'kselftest/kvm/access_tracking_perf_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/demand_paging_test.c', needed by 'kselftest/kvm/demand_paging_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/dirty_log_test.c', needed by 'kselftest/kvm/dirty_log_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/dirty_log_perf_test.c', needed by 'kselftest/kvm/dirty_log_perf_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/hardware_disable_test.c', needed by 'kselftest/kvm/hardware_disable_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/kvm_create_max_vcpus.c', needed by 'kselftest/kvm/kvm_create_max_vcpus.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/kvm_page_table_test.c', needed by 'kselftest/kvm/kvm_page_table_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/max_guest_memory_test.c', needed by 'kselftest/kvm/max_guest_memory_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/memslot_modification_stress_test.c', needed by 'kselftest/kvm/memslot_modification_stress_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/memslot_perf_test.c', needed by 'kselftest/kvm/memslot_perf_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/rseq_test.c', needed by 'kselftest/kvm/rseq_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/set_memory_region_test.c', needed by 'kselftest/kvm/set_memory_region_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/steal_time.c', needed by 'kselftest/kvm/steal_time.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/kvm_binary_stats_test.c', needed by 'kselftest/kvm/kvm_binary_stats_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/system_counter_offset_test.c', needed by 'kselftest/kvm/system_counter_offset_test.o'.
   make[1]: *** No rule to make target 'kselftest/kvm/x86_64/nx_huge_pages_test.c', needed by 'kselftest/kvm/x86_64/nx_huge_pages_test.o'.
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
