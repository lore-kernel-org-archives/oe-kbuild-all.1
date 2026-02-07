Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2441256C84
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471592; cv=none; b=EwjzpF7LNmX+sQVwwi/IpUlzWI21issYaDg0BDzThzuT6qjW76FeeBN0R8S52fJKSWjGk4e83vw7jODPMUdnUD5iEb1ME9Pjp0s5IZgqtla40wLAwAMcflYVBeS1iDTyaU5m6ziKtBcOfwgaZhxma8i+3V3MtWPMVWVgRXSVlIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471592; c=relaxed/simple;
	bh=OZ2mrvXepXzyVBe9//zF+ptGiKmIzRe4DdZyFuU3kVA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=DyiB/Q74C8WjrMz9GqgO6NW+VoRwWlSWr1pbHBDNZYJyIjaDDK6ZpB4hH5tC90Z/s1cPBRG9HKQK7WAFwp5gfvYrhqTw3gn+5RS9bBeV8cKfG+tZHcpQmYvzWfbXxPwnJT4J7tEnqcaD+4sxLuaGISDfY4+M28nst3k+hY+7Cnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=tG2UXq5b; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="tG2UXq5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZkXm3QuKXdmB22xSbQ3Uog0ngwzsDPcWOUQXbcSbA/c=;
  b=tG2UXq5bqOO48V1FGK1VbxNhvlJBc0fFduf3q3WF6OLG/neQRwMt7rZs
   IgtdKz6ifDapOWS4pbDgBOdy7ZjeemUtjCTV0YVcLs4NZlFMZxsSJUF1m
   rcBKDuhg1A/0uanuQBlkJretOegb7fApiUKA7SpaO91s0H86ZaBSrgcxP
   E=;
X-CSE-ConnectionGUID: BbTcUMwMQhu4ddTU0d7WVA==
X-CSE-MsgGUID: SQRJsu0hSdioy9jLO1A59w==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,278,1763420400"; 
   d="scan'208";a="262387624"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 14:38:39 +0100
Date: Sat, 7 Feb 2026 08:38:37 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: cros-kernel-buildreports@googlegroups.com
cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/6] net/mac80211/link.c:26:7-11:
 ERROR: iterator variable bound on line 23 cannot be NULL (fwd)
Message-ID: <a186fdc1-d4ec-3a28-d826-60ddb8dc121f@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sat, 07 Feb 2026 20:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android16-6.12-desktop 0/6]
    net/mac80211/link.c:26:7-11: ERROR: iterator variable bound on line 23
    cannot be NULL

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: d383657857385e44a921b591adf4b546d6f5cb90 [0/6] wifi: mac80211: Create separate links for VLAN interfaces
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-101-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072026.2O3OdR2g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602072026.2O3OdR2g-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/link.c:26:7-11: ERROR: iterator variable bound on line 23 cannot be NULL

vim +26 net/mac80211/link.c

e73b5e51a05d41 Johannes Berg 2022-09-02  14
d383657857385e Muna Sinada   2025-03-25  15  static void ieee80211_update_apvlan_links(struct ieee80211_sub_if_data *sdata)
d383657857385e Muna Sinada   2025-03-25  16  {
d383657857385e Muna Sinada   2025-03-25  17  	struct ieee80211_sub_if_data *vlan;
d383657857385e Muna Sinada   2025-03-25  18  	struct ieee80211_link_data *link;
d383657857385e Muna Sinada   2025-03-25  19  	u16 ap_bss_links = sdata->vif.valid_links;
d383657857385e Muna Sinada   2025-03-25  20  	u16 new_links, vlan_links;
d383657857385e Muna Sinada   2025-03-25  21  	unsigned long add;
d383657857385e Muna Sinada   2025-03-25  22
d383657857385e Muna Sinada   2025-03-25 @23  	list_for_each_entry(vlan, &sdata->u.ap.vlans, u.vlan.list) {
d383657857385e Muna Sinada   2025-03-25  24  		int link_id;
d383657857385e Muna Sinada   2025-03-25  25
d383657857385e Muna Sinada   2025-03-25 @26  		if (!vlan)
d383657857385e Muna Sinada   2025-03-25  27  			continue;
d383657857385e Muna Sinada   2025-03-25  28
d383657857385e Muna Sinada   2025-03-25  29  		/* No support for 4addr with MLO yet */
d383657857385e Muna Sinada   2025-03-25  30  		if (vlan->wdev.use_4addr)
d383657857385e Muna Sinada   2025-03-25  31  			return;
d383657857385e Muna Sinada   2025-03-25  32
d383657857385e Muna Sinada   2025-03-25  33  		vlan_links = vlan->vif.valid_links;
d383657857385e Muna Sinada   2025-03-25  34
d383657857385e Muna Sinada   2025-03-25  35  		new_links = ap_bss_links;
d383657857385e Muna Sinada   2025-03-25  36
d383657857385e Muna Sinada   2025-03-25  37  		add = new_links & ~vlan_links;
d383657857385e Muna Sinada   2025-03-25  38  		if (!add)
d383657857385e Muna Sinada   2025-03-25  39  			continue;
d383657857385e Muna Sinada   2025-03-25  40
d383657857385e Muna Sinada   2025-03-25  41  		ieee80211_vif_set_links(vlan, add, 0);
d383657857385e Muna Sinada   2025-03-25  42
d383657857385e Muna Sinada   2025-03-25  43  		for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
d383657857385e Muna Sinada   2025-03-25  44  			link = sdata_dereference(vlan->link[link_id], vlan);
d383657857385e Muna Sinada   2025-03-25  45  			ieee80211_link_vlan_copy_chanctx(link);
d383657857385e Muna Sinada   2025-03-25  46  		}
d383657857385e Muna Sinada   2025-03-25  47  	}
d383657857385e Muna Sinada   2025-03-25  48  }
d383657857385e Muna Sinada   2025-03-25  49

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
