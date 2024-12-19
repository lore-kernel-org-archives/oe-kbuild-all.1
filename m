Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84132217719
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 05:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734587738; cv=none; b=SVwHVaLTVvDV54nYx3/jJRQSHYZQJaj2loAwGuirin/g6rk1FXR1C6pIKa4kbxK0NckplzipNfos8bGsu+ByqnNaEbYTDM+YvmnWGFh9LsJ3eEOcZsP0MnsClmwgwVUvrPabWUjzAghABN8UEd9hU7N+0NDsb42BM/fibd+T23Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734587738; c=relaxed/simple;
	bh=FXtzseKz/oEaUNrHZeU0GJBTRRMdMqSCrY61kkP2LXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkRoVPKMX3k3WJ2hhqntlErnDIUXXdEeDtKyhgF59BMjYDtIGdzmrPj28ByEYkq+7eflQNMwy61q2szACw5UFq+aP0LLmi1+66tzLBXvPw9zotBWcMGkizvTScJingxah8epFaQ4mj8p7YgGP9jUnDr/xh5MnqqTLfNiEUvYqrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYNIxsEy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYNIxsEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734587736; x=1766123736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FXtzseKz/oEaUNrHZeU0GJBTRRMdMqSCrY61kkP2LXA=;
  b=PYNIxsEyJ6xjne6RZWM+FDC/NkHONG5MAmayxqKYtahXnBrlt72Xzs7E
   ItFVhnYcEV0Z+LMU2I+LYm6EqDRz2HO8Oh6sE8z9eLbRhalF2rH1ODU4l
   9FaSow7QEyxGfzhiSSYfd8Y1qZhupQj+DVH5FBbsc5znvHZAT31HxNnM3
   MBIeemTnYA46K96EHspRauXhYkqMJFdvRpswhbI4FWArOclK0cA39P7YJ
   P0EZsZxS9vHZLDYvFYhOM5CnEi3WSQPBdIEoa6HAjw6jyXYyg5pbDZ7B8
   VWTFp/vBSKpkCCpkpKM8oo8PoEAAWnsh7zfSz3BLMIkU+5O6Edeg+N7VF
   Q==;
X-CSE-ConnectionGUID: eOIruvPdTdS4nj3LXkXY/w==
X-CSE-MsgGUID: u5PFi2uETrKB1lsoLqzVBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="60468484"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="60468484"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 21:55:36 -0800
X-CSE-ConnectionGUID: DV1Bjg1qSlqSc28bi6q75g==
X-CSE-MsgGUID: tukKylGWSvqPf/ueCDII5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="98631045"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Dec 2024 21:55:34 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tO9VT-000047-1R;
	Thu, 19 Dec 2024 05:55:31 +0000
Date: Thu, 19 Dec 2024 13:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [rafael-pm:bleeding-edge 37/51] thermal_netlink.c:undefined
 reference to `sk_skb_reason_drop'
Message-ID: <202412191310.7OD0ztSD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   e2bbcfa0b21a5bb2cf1e5fff2f1336515fb228a9
commit: 4596cbea0ed2ef4f563a92775c9f612700ece145 [37/51] thermal: intel: Remove explicit user_space governor selection
config: i386-buildonly-randconfig-001-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191310.7OD0ztSD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412191310.7OD0ztSD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412191310.7OD0ztSD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/thermal/thermal_netlink.o: in function `nla_put_u32':
   thermal_netlink.c:(.text+0x13): undefined reference to `nla_put'
   ld: drivers/thermal/thermal_netlink.o: in function `nla_nest_start_noflag':
   thermal_netlink.c:(.text+0x279): undefined reference to `nla_put'
   ld: drivers/thermal/thermal_netlink.o: in function `nla_put_string':
   thermal_netlink.c:(.text+0x2b1): undefined reference to `nla_put'
   ld: drivers/thermal/thermal_netlink.o: in function `nlmsg_trim':
   thermal_netlink.c:(.text+0x53e): undefined reference to `skb_trim'
   ld: drivers/thermal/thermal_netlink.o: in function `thermal_genl_cmd_dumpit':
   thermal_netlink.c:(.text+0x6f6): undefined reference to `genlmsg_put'
   ld: drivers/thermal/thermal_netlink.o: in function `thermal_group_has_listeners':
   thermal_netlink.c:(.text+0x785): undefined reference to `init_net'
   ld: thermal_netlink.c:(.text+0x78c): undefined reference to `netlink_has_listeners'
   ld: drivers/thermal/thermal_netlink.o: in function `alloc_skb.constprop.0':
   thermal_netlink.c:(.text+0x7c6): undefined reference to `__alloc_skb'
   ld: drivers/thermal/thermal_netlink.o: in function `kfree_skb':
>> thermal_netlink.c:(.text+0x7dd): undefined reference to `sk_skb_reason_drop'
   ld: drivers/thermal/thermal_netlink.o: in function `genlmsg_multicast.constprop.0.isra.0':
   thermal_netlink.c:(.text+0x830): undefined reference to `init_net'
   ld: thermal_netlink.c:(.text+0x842): undefined reference to `netlink_broadcast_filtered'
   ld: drivers/thermal/thermal_netlink.o: in function `thermal_genl_send_event':
   thermal_netlink.c:(.text+0x8ba): undefined reference to `genlmsg_put'
   ld: drivers/thermal/thermal_netlink.o: in function `thermal_genl_cmd_doit':
   thermal_netlink.c:(.text+0xe01): undefined reference to `genlmsg_put'
   ld: thermal_netlink.c:(.text+0xe44): undefined reference to `init_net'
   ld: thermal_netlink.c:(.text+0xe49): undefined reference to `netlink_unicast'
   ld: drivers/thermal/thermal_netlink.o: in function `thermal_genl_sampling_temp':
   thermal_netlink.c:(.text+0xeb4): undefined reference to `genlmsg_put'
   ld: drivers/thermal/thermal_netlink.o: in function `thermal_netlink_init':
   thermal_netlink.c:(.init.text+0xe): undefined reference to `genl_register_family'
   ld: drivers/thermal/thermal_netlink.o: in function `thermal_netlink_exit':
   thermal_netlink.c:(.init.text+0x22): undefined reference to `genl_unregister_family'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for THERMAL_NETLINK
   Depends on [n]: THERMAL [=y] && NET [=n]
   Selected by [m]:
   - X86_PKG_TEMP_THERMAL [=m] && THERMAL [=y] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86_THERMAL_VECTOR [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
