Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F81459FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 19:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769282678; cv=none; b=CJkFePkmxl2cYbcyT/4l71eJQbEMKFXSKm9NgAdCYROW/L1C7YKtcZGdBfFzYRd+0JqPjuQXzrtXv6jMw4JWoSJ24IsxqI9kWmspUjkrx2DI7HCNH9UIM30UggyI2KuWnf15yUiQQHr+gwuf32gdoc1iPg2siDDcW6WiYfjw+90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769282678; c=relaxed/simple;
	bh=b6EjU2jCvglkN3TYWcmo5cBz6KeOyG7O1r6ByCMbmW4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WqRonvzSms7whIVO0iy9mfwAr4VeXreZ0zJ29ZXP6Y/xdDGzt958wK1O1nJVo9dBnQPecs83FtKGEdkXilYYTPzWXxWb84027+kaeT+fnJ7Jq1t0n0qHW/5B6OfhpLwI3USJPQ7M8o9wl7EJ5dxRsQ2niWhbWQeWRyBGz178X7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5HS8ima; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5HS8ima"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769282676; x=1800818676;
  h=date:from:to:cc:subject:message-id;
  bh=b6EjU2jCvglkN3TYWcmo5cBz6KeOyG7O1r6ByCMbmW4=;
  b=R5HS8imaQncaJSpuoRFnmLOCpFKNyrFS4khpk8a2ncN5QnvH9QA3C97r
   +2r/AlqHe7ZGFOLV0Qu6FJDzn2CNYb5YtuaNL08agqPcWBwYKFvwkLbvB
   DcRWwzSFRAdRt4B19VNgMjGtUCf1ViTI7t8oMr9zr01XX8zbz9DeO3Ol2
   l0M5wtnHmXAGMG+YJmmKSLy0CBBsidq2O5FzlA8QhlMHy+ZO5yKE76fZS
   Hndkk4mknkHRbz4+Tz1p+xLYwK9BM3570UJcuz358d0C+SqfKT7UIw11U
   ASPZD4Ov1aJqNQNbGG7UMUkqm5dLv9J/Fk7M5ZvMzJ13cwpe16tG75wVm
   g==;
X-CSE-ConnectionGUID: c45dx5RrQOm4aMy/qFqRoQ==
X-CSE-MsgGUID: 4OWgA1kNQja0vRh0st60ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="93168395"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="93168395"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 11:24:35 -0800
X-CSE-ConnectionGUID: Q/BcpViQTQ6hZ/w1/Q5tmg==
X-CSE-MsgGUID: o1U/YerDQEWbfNs3ZXDhnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="207651994"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2026 11:24:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjjFG-00000000VU6-2jTy;
	Sat, 24 Jan 2026 19:24:30 +0000
Date: Sun, 25 Jan 2026 03:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Gao <chao.gao@intel.com>,
 Xin Li <xin@zytor.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [kvm-x86:vmx 5/6] arch/x86/kvm/vmx/nested.c:89
 init_vmcs_shadow_fields() warn: inconsistent indenting
Message-ID: <202601250328.eLflfhWP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kvm-x86/linux vmx
head:   759b00944900c898c3b84b3a8716f5675f7d9432
commit: 1cfadd7519c0842c0de377b43660cdb51b011875 [5/6] KVM: nVMX: Disallow access to vmcs12 fields that aren't supported by "hardware"
config: x86_64-randconfig-161-20260124 (https://download.01.org/0day-ci/archive/20260125/202601250328.eLflfhWP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250328.eLflfhWP-lkp@intel.com/

smatch warnings:
arch/x86/kvm/vmx/nested.c:89 init_vmcs_shadow_fields() warn: inconsistent indenting

vim +89 arch/x86/kvm/vmx/nested.c

    53	
    54	struct shadow_vmcs_field {
    55		u16	encoding;
    56		u16	offset;
    57	};
    58	static struct shadow_vmcs_field shadow_read_only_fields[] = {
    59	#define SHADOW_FIELD_RO(x, y) { x, offsetof(struct vmcs12, y) },
    60	#include "vmcs_shadow_fields.h"
    61	};
    62	static int max_shadow_read_only_fields =
    63		ARRAY_SIZE(shadow_read_only_fields);
    64	
    65	static struct shadow_vmcs_field shadow_read_write_fields[] = {
    66	#define SHADOW_FIELD_RW(x, y) { x, offsetof(struct vmcs12, y) },
    67	#include "vmcs_shadow_fields.h"
    68	};
    69	static int max_shadow_read_write_fields =
    70		ARRAY_SIZE(shadow_read_write_fields);
    71	
    72	static void init_vmcs_shadow_fields(void)
    73	{
    74		int i, j;
    75	
    76		memset(vmx_vmread_bitmap, 0xff, PAGE_SIZE);
    77		memset(vmx_vmwrite_bitmap, 0xff, PAGE_SIZE);
    78	
    79		for (i = j = 0; i < max_shadow_read_only_fields; i++) {
    80			struct shadow_vmcs_field entry = shadow_read_only_fields[i];
    81			u16 field = entry.encoding;
    82	
    83			if (vmcs_field_width(field) == VMCS_FIELD_WIDTH_U64 &&
    84			    (i + 1 == max_shadow_read_only_fields ||
    85			     shadow_read_only_fields[i + 1].encoding != field + 1))
    86				pr_err("Missing field from shadow_read_only_field %x\n",
    87				       field + 1);
    88	
  > 89		       if (get_vmcs12_field_offset(field) < 0)
    90				continue;
    91	
    92			clear_bit(field, vmx_vmread_bitmap);
    93			if (field & 1)
    94	#ifdef CONFIG_X86_64
    95				continue;
    96	#else
    97				entry.offset += sizeof(u32);
    98	#endif
    99			shadow_read_only_fields[j++] = entry;
   100		}
   101		max_shadow_read_only_fields = j;
   102	
   103		for (i = j = 0; i < max_shadow_read_write_fields; i++) {
   104			struct shadow_vmcs_field entry = shadow_read_write_fields[i];
   105			u16 field = entry.encoding;
   106	
   107			if (vmcs_field_width(field) == VMCS_FIELD_WIDTH_U64 &&
   108			    (i + 1 == max_shadow_read_write_fields ||
   109			     shadow_read_write_fields[i + 1].encoding != field + 1))
   110				pr_err("Missing field from shadow_read_write_field %x\n",
   111				       field + 1);
   112	
   113			WARN_ONCE(field >= GUEST_ES_AR_BYTES &&
   114				  field <= GUEST_TR_AR_BYTES,
   115				  "Update vmcs12_write_any() to drop reserved bits from AR_BYTES");
   116	
   117			if (get_vmcs12_field_offset(field) < 0)
   118				continue;
   119	
   120			/*
   121			 * PML and the preemption timer can be emulated, but the
   122			 * processor cannot vmwrite to fields that don't exist
   123			 * on bare metal.
   124			 */
   125			switch (field) {
   126			case GUEST_PML_INDEX:
   127				if (!cpu_has_vmx_pml())
   128					continue;
   129				break;
   130			case VMX_PREEMPTION_TIMER_VALUE:
   131				if (!cpu_has_vmx_preemption_timer())
   132					continue;
   133				break;
   134			case GUEST_INTR_STATUS:
   135				if (!cpu_has_vmx_apicv())
   136					continue;
   137				break;
   138			default:
   139				break;
   140			}
   141	
   142			clear_bit(field, vmx_vmwrite_bitmap);
   143			clear_bit(field, vmx_vmread_bitmap);
   144			if (field & 1)
   145	#ifdef CONFIG_X86_64
   146				continue;
   147	#else
   148				entry.offset += sizeof(u32);
   149	#endif
   150			shadow_read_write_fields[j++] = entry;
   151		}
   152		max_shadow_read_write_fields = j;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
