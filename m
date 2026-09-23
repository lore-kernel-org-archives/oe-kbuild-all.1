Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0E11DF980
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 21:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199899; cv=none; b=n/L7cYBQYa5+1Fhh1dOaDDdgVQeRT9l4Hx6vHubFgcDXpTiKk5/9ylYUxww634GQxgY8zlqa4On67KlArCy703E2HkBcEyON1qcBeGOup7Kf/PV5h08EuqqTMcB49Gb3Mt650Klj0sUoVTOdKHNGrphrjkgr32vfFRS/wwsw/bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199899; c=relaxed/simple;
	bh=hMcRmCD75jI9k98OpShsxdhHugNXEz6mg8rQU09o1Tk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d3MTG3frmJCpU8wnSnpmqFvhgiliuFrJgNSt6KD+3dx7C1oXT1RVKms+fWLrD/1mFhUM/ZL+eRVxpMw3QG0Bjy92MSCT1dhgdedOnK/NKUi1O+9sCz6PV840zkWhOaXVdoGc53j1JnFWtVt00IjxeBMC4h364kv+AoXBxIazE3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpDPJ4/8; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpDPJ4/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790199897; x=1821735897;
  h=date:from:to:cc:subject:message-id;
  bh=hMcRmCD75jI9k98OpShsxdhHugNXEz6mg8rQU09o1Tk=;
  b=JpDPJ4/8OOKemjSv8GX0syNvF0mez6SAy/PDNRarQwydNarS5hPnYEhD
   6HqGtVe0tRpfm1hWsh2V9pV0qJKmgjNigwsXdmNYuF2zmfiuHF6nxcNNx
   k9AN12Ifrg5M/5Ja9uK58jucO/qvxkC+2EeKa5z2LqdvLKnhfa00GjP/v
   uL8bNprUsegM5JgDaY3r74tfM0Rl7pN0GVJsLMz77p8Qb0JxLPO/fM4vo
   uv65yd3xJ5nJCCG5qJ969oPBZkgF0APx0v9GoJ6/jLdLnBiAGJARtfyP4
   SwaqBJxxxEHIQYflXbP4et5c7dmrvKlim02X79uK1/9VlAsrvGrsewzOe
   Q==;
X-CSE-ConnectionGUID: ftYSIU7zRy6pYC2HhHR2Qg==
X-CSE-MsgGUID: YiTdVIZ7SM6QNgsRElvk6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1457903"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1457903"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:44:56 -0700
X-CSE-ConnectionGUID: EwM2NfY1Sq2RLUh5aH058w==
X-CSE-MsgGUID: OrQxbDRNSHagYZNgMJJyUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5045506"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 23 Sep 2026 14:44:55 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Ulo-0000000003y-3iCW;
	Wed, 23 Sep 2026 21:44:52 +0000
Date: Wed, 23 Sep 2026 23:44:18 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 4/4]
 net/bluetooth/hci_conn.c:1807:7-14: WARNING opportunity for kmemdup
Message-ID: <202609232327.ztAxhH6f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   f26a1f4f9013533dd2b0de85e6813f948363a4ff
commit: 4aa515393f02f69cb33121f8aac9078c6c925297 [4/4] Bluetooth: ISO: use hci_sync for setting CIG parameters
config: i386-randconfig-2103-20260923 (https://download.01.org/0day-ci/archive/20260923/202609232327.ztAxhH6f-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609232327.ztAxhH6f-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/bluetooth/hci_conn.c:1807:7-14: WARNING opportunity for kmemdup

vim +1807 net/bluetooth/hci_conn.c

  1731	
  1732	static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
  1733	{
  1734		struct hci_dev *hdev = conn->hdev;
  1735		struct iso_list_data data;
  1736		struct iso_cig_params *pdu;
  1737	
  1738		memset(&data, 0, sizeof(data));
  1739	
  1740		/* Allocate a CIG if not set */
  1741		if (qos->cig == BT_ISO_QOS_CIG_UNSET) {
  1742			for (data.cig = 0x00; data.cig < 0xff; data.cig++) {
  1743				data.count = 0;
  1744				data.cis = 0xff;
  1745	
  1746				hci_conn_hash_list_state(hdev, cis_list, ISO_LINK,
  1747							 BT_BOUND, &data);
  1748				if (data.count)
  1749					continue;
  1750	
  1751				hci_conn_hash_list_state(hdev, cis_list, ISO_LINK,
  1752							 BT_CONNECTED, &data);
  1753				if (!data.count)
  1754					break;
  1755			}
  1756	
  1757			if (data.cig == 0xff)
  1758				return false;
  1759	
  1760			/* Update CIG */
  1761			qos->cig = data.cig;
  1762		}
  1763	
  1764		data.pdu.cp.cig_id = qos->cig;
  1765		hci_cpu_to_le24(qos->out.interval, data.pdu.cp.c_interval);
  1766		hci_cpu_to_le24(qos->in.interval, data.pdu.cp.p_interval);
  1767		data.pdu.cp.sca = qos->sca;
  1768		data.pdu.cp.packing = qos->packing;
  1769		data.pdu.cp.framing = qos->framing;
  1770		data.pdu.cp.c_latency = cpu_to_le16(qos->out.latency);
  1771		data.pdu.cp.p_latency = cpu_to_le16(qos->in.latency);
  1772	
  1773		if (qos->cis != BT_ISO_QOS_CIS_UNSET) {
  1774			data.count = 0;
  1775			data.cig = qos->cig;
  1776			data.cis = qos->cis;
  1777	
  1778			hci_conn_hash_list_state(hdev, cis_list, ISO_LINK, BT_BOUND,
  1779						 &data);
  1780			if (data.count)
  1781				return false;
  1782	
  1783			cis_add(&data, qos);
  1784		}
  1785	
  1786		/* Reprogram all CIS(s) with the same CIG */
  1787		for (data.cig = qos->cig, data.cis = 0x00; data.cis < 0x11;
  1788		     data.cis++) {
  1789			data.count = 0;
  1790	
  1791			hci_conn_hash_list_state(hdev, cis_list, ISO_LINK, BT_BOUND,
  1792						 &data);
  1793			if (data.count)
  1794				continue;
  1795	
  1796			/* Allocate a CIS if not set */
  1797			if (qos->cis == BT_ISO_QOS_CIS_UNSET) {
  1798				/* Update CIS */
  1799				qos->cis = data.cis;
  1800				cis_add(&data, qos);
  1801			}
  1802		}
  1803	
  1804		if (qos->cis == BT_ISO_QOS_CIS_UNSET || !data.pdu.cp.num_cis)
  1805			return false;
  1806	
> 1807		pdu = kzalloc(sizeof(*pdu), GFP_KERNEL);
  1808		if (!pdu)
  1809			return false;
  1810	
  1811		memcpy(pdu, &data.pdu, sizeof(*pdu));
  1812	
  1813		if (hci_cmd_sync_queue(hdev, set_cig_params_sync, pdu,
  1814				       set_cig_params_complete) < 0) {
  1815			kfree(pdu);
  1816			return false;
  1817		}
  1818	
  1819		return true;
  1820	}
  1821	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
