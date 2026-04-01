Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D2C2FFDD6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775071451; cv=none; b=MjKnfMnJTh74H4liHHCDo4YjUsu0IfZwnbgv5HkQtmJu6Bcpq0wZUwoth5I97UH3RsLaxSzc2ABQXcxQ6qwTms/M21bQzeBDrQryEBxV7qGc2juzOVp6VC+wfz8O34D5JxMnqAROAD40/98iucLN7t2hzEsP+7U3SnBvzZbRZGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775071451; c=relaxed/simple;
	bh=RqJdmJFlLC0DtM7sXyDTlS1Wh4WBWvK2N5Q5IiFvZz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XTci0zzbFJWnwe3OqEEakG3Le/fqxPjdid4vOjc9tnR5IrqUd/T88K1ngIDXRXHhF1LyOeOlZ8y0JhVJiqWMlllpitYTA/kzVyvtnzTZtF8vCyUNME4lW5zGPzGTznrBZ6MA5XBG1bRtwKTVUgcKdmd9egAy0Yd/mfDnEvo8LMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mumOK0Mv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mumOK0Mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775071450; x=1806607450;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RqJdmJFlLC0DtM7sXyDTlS1Wh4WBWvK2N5Q5IiFvZz8=;
  b=mumOK0Mv8dpI+oexMcGTed/OWOhGONAICDsIVn/NJCNYeG+ko0J2Ow6R
   d2hiuYAeLAast8k86SL/aJH/gJe5GjnaSssI+osqW5XPBZam19ycvwRoG
   rw1dg7B2e+5Bvoz6g4WOjqiKztzza8IuDV9IQYjlXJlqWnmg6W3KcHRFi
   S1XR7cjWouIubVvD5kd4DqrmXh8viDuLkOfCLwyUY7wlawUIfFixVcn53
   dXzZuo42ZWklpaeAOxBiJjY+pODJEd2rBcbX8aJaaGHt9DV5LcrL1TFiY
   x/l7lZ1aRNokAlh2cVuTCIrp88KLRsA5BLiKQtBbICg8a4i1Ym+OR206u
   A==;
X-CSE-ConnectionGUID: vpOR6RhKSayrBDpv5iqrbw==
X-CSE-MsgGUID: Eb+aLTefRhqfNaa+Zf+EMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76087297"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76087297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 12:24:10 -0700
X-CSE-ConnectionGUID: ADMgxj0+Qr6zDGLtjo/pdA==
X-CSE-MsgGUID: PTDJVO1PRyObCHBvlHF6GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="227019847"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2026 12:24:07 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w81Ab-000000008nR-0u0N;
	Wed, 01 Apr 2026 19:24:05 +0000
Date: Wed, 01 Apr 2026 21:23:42 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:deprecate-legacy-ip 5/6] net/mac80211/main.c:1650:2:
 warning: label 'fail_ifa' defined but not used
Message-ID: <202604012118.Wg7T70FJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/dwmw2/linux deprecate-legacy-ip
head:   2d2acff90d1c42a747b3fed5ce9189622f49daa3
commit: 3f213df15191632a3cb32932955ee90bff8385a0 [5/6] net: Change CONFIG_I=
NET to CONFIG_LEGACY_IP for IPv4-only code
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260401/2=
02604012118.Wg7T70FJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260401/202604012118.Wg7T70FJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604012118.Wg7T70FJ-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   net/mac80211/main.c: In function 'ieee80211_register_hw':
>> net/mac80211/main.c:1650:2: warning: label 'fail_ifa' defined but not us=
ed [-Wunused-label]
    1650 |  fail_ifa:
         |  ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IP_MROUTE_COMMON
   Depends on [n]: NET [=3Dy] && INET [=3Dy] && LEGACY_IP [=3Dn] && (IP_MRO=
UTE [=3Dn] || IPV6_MROUTE [=3Dy])
   Selected by [y]:
   - IPV6_MROUTE [=3Dy] && NET [=3Dy] && INET [=3Dy] && IPV6 [=3Dy]
   WARNING: unmet direct dependencies detected for IP_ROUTE_CLASSID
   Depends on [n]: NET [=3Dy] && INET [=3Dy] && LEGACY_IP [=3Dn]
   Selected by [m]:
   - NETFILTER_XT_MATCH_REALM [=3Dm] && NET [=3Dy] && INET [=3Dy] && NETFIL=
TER [=3Dy] && NETFILTER_XTABLES [=3Dy] && NETFILTER_ADVANCED [=3Dy]
   WARNING: unmet direct dependencies detected for INET_TUNNEL
   Depends on [n]: NET [=3Dy] && INET [=3Dy] && LEGACY_IP [=3Dn]
   Selected by [m]:
   - IPV6_SIT [=3Dm] && NET [=3Dy] && INET [=3Dy] && IPV6 [=3Dy]


vim +/fail_ifa +1650 net/mac80211/main.c

a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1640 =20
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1641  	return 0;
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1642 =20
a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1643  #if IS_ENABLED(CONFIG_IPV6)
a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1644   fail_ifa6:
3f213df1519163 net/mac80211/main.c      David Woodhouse        2026-03-31  =
1645  #ifdef CONFIG_LEGACY_IP
a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1646  	unregister_inetaddr_notifier(&local->ifa_notifier);
a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1647  #endif
a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1648  #endif
3f213df1519163 net/mac80211/main.c      David Woodhouse        2026-03-31  =
1649  #if defined(CONFIG_LEGACY_IP) || defined(CONFIG_IPV6)
2b2c009ecf71f4 net/mac80211/main.c      Juuso Oikarinen        2010-05-27 @=
1650   fail_ifa:
93c08c32914264 net/mac80211/main.c      Juuso Oikarinen        2010-08-03  =
1651  #endif
52e04b4ce5d037 net/mac80211/main.c      Sumit Garg             2020-04-07  =
1652  	wiphy_unregister(local->hw.wiphy);
52e04b4ce5d037 net/mac80211/main.c      Sumit Garg             2020-04-07  =
1653   fail_wiphy_register:
54330bf63b4968 net/mac80211/main.c      Johannes Berg          2015-01-21  =
1654  	rtnl_lock();
54330bf63b4968 net/mac80211/main.c      Johannes Berg          2015-01-21  =
1655  	rate_control_deinitialize(local);
10f644a47b76d3 net/mac80211/main.c      Johannes Berg          2009-04-16  =
1656  	ieee80211_remove_interfaces(local);
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1657  	rtnl_unlock();
52e04b4ce5d037 net/mac80211/main.c      Sumit Garg             2020-04-07  =
1658   fail_rate:
b7600aae8a20ff net/mac80211/main.c      Johannes Berg          2023-08-29  =
1659  	ieee80211_txq_teardown_flows(local);
dc8b274f0952f6 net/mac80211/main.c      Toke H=C3=B8iland-J=C3=B8rgensen 20=
18-05-25  1660   fail_flows:
6dd47d9754ff05 net/mac80211/main.c      Johannes Berg          2019-11-05  =
1661  	ieee80211_led_exit(local);
42935ecaf4e784 net/mac80211/main.c      Luis R. Rodriguez      2009-07-29  =
1662  	destroy_workqueue(local->workqueue);
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1663   fail_workqueue:
11ba964d4f9366 net/mac80211/main.c      Johannes Berg          2009-08-19  =
1664  	kfree(local->int_scan_req);
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1665  	return result;
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1666  }
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1667  EXPORT_SYMBOL(ieee80211_register_hw);
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1668 =20

:::::: The code at line 1650 was first introduced by commit
:::::: 2b2c009ecf71f4c66ff8420b63dddbc9737e04e3 mac80211: Add support for h=
ardware ARP query filtering

:::::: TO: Juuso Oikarinen <juuso.oikarinen@nokia.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
