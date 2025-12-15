Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42023279792
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 20:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765829902; cv=none; b=bsI9BH6AstnM9wsNMN9OFny4R9u3qGk1X8hWm8Ok8emQP7bTa0grjr7MCp+AT2h9fCPSMi50rDHolp2gaWHVTNsUonDM4zCaxJGoHXkdj/vqrNFeIU2XLLoe8oozbwHlklGVioImIuSscx/OkBcEIzeKcCtENahcx0k93NHecwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765829902; c=relaxed/simple;
	bh=QJbkAkSiPcqVM3ewR636HxcfJEFi6u5W57AoiTloH1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lFaDGU7pGGYhLkm8SxwaWYBrQoLe3GcxCrpLMmgDClhd7ILpXXqvLAzSymsvtSNYcIS7UV5LfgNNyG173e+M03SNZyWdOsJXEKJ/2z4z3yjVuUdql3fXWnk6ccyFaUYWTMgpuXaBBsMNKi3pSApZ5wEW5F4Tp4uUeg0E9vf6iCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzPA4tW3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzPA4tW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765829900; x=1797365900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJbkAkSiPcqVM3ewR636HxcfJEFi6u5W57AoiTloH1E=;
  b=gzPA4tW3eldEdIipLdLXVIJrdMq5IqYoVquRmMOFbA1WD0Vu++m5duT+
   gF8DEQo3ewUwn0x4iKnVTH2QtaAuiEDzz68x0VjOOI5gzj7gzA7EP56JO
   HQ44/oDAqRc+Baj4B+ZmhsxvKJiBYLLq2bWvYjVHwjoVBHG34PlmAfVd2
   wquQqapeO2SlQ7pyjWnFVw37wcM9ivW1uT25eCb2Waq1AVhvrQrmn8Kp4
   aiAvoXM3SqHAOalXp5ma4u9GEfefutX81gErx4hBfx41V67kxD9oLQOL3
   FrRzZi8odzWM8GmiVVRuhk55wSlw2IA5+d1aI3gSh5yc0DtHIkzkidu1z
   g==;
X-CSE-ConnectionGUID: 1NfUO1m9TxS5DWUSGZsQbQ==
X-CSE-MsgGUID: alLTXKCUTnmTQLvx8QbH1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67624242"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67624242"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 12:18:20 -0800
X-CSE-ConnectionGUID: 8h2mctb0SxSqSYhejbNkxA==
X-CSE-MsgGUID: 9QYvUUrrTUiIp+XcbPxomg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197865530"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Dec 2025 12:18:17 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVF1L-000000000iT-1JH0;
	Mon, 15 Dec 2025 20:18:15 +0000
Date: Tue, 16 Dec 2025 04:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:426:47: warning: '%s'
 directive output may be truncated writing up to 215 bytes into a region of
 size 32
Message-ID: <202512160401.roOuEkC5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: b720e864f9c6fe26c6f7ab01738fe9257bfe2a1b [25/25] anolis: drivers/bzwx: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251216/202512160401.roOuEkC5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160401.roOuEkC5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160401.roOuEkC5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:1615:32: warning: initialized field overwritten [-Woverride-init]
    1615 |         .self_test           = ne6x_diag_test,
         |                                ^~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:1615:32: note: (near initialization for 'ne6x_ethtool_ops.self_test')
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c: In function 'ne6x_get_strings':
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:426:47: warning: '%s' directive output may be truncated writing up to 215 bytes into a region of size 32 [-Wformat-truncation=]
     426 |                 snprintf(p, ETH_GSTRING_LEN, "%s", ne6x_gstrings_priv_flags[i].name);
         |                                               ^~
   In function 'ne6x_get_priv_flag_strings',
       inlined from 'ne6x_get_strings' at drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:441:3:
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:426:17: note: 'snprintf' output between 1 and 216 bytes into a destination of size 32
     426 |                 snprintf(p, ETH_GSTRING_LEN, "%s", ne6x_gstrings_priv_flags[i].name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:258:5: warning: no previous prototype for 'ne6x_adpt_request_irq_msix' [-Wmissing-prototypes]
     258 | int ne6x_adpt_request_irq_msix(struct ne6x_adapter *adpt, char *basename)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:340:5: warning: no previous prototype for 'ne6x_adpt_request_irq_intx' [-Wmissing-prototypes]
     340 | int ne6x_adpt_request_irq_intx(struct ne6x_adapter *adpt, char *basename)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:607:13: warning: no previous prototype for 'ne6x_msix_clean_vf_mbx' [-Wmissing-prototypes]
     607 | irqreturn_t ne6x_msix_clean_vf_mbx(int irq, void *data)
         |             ^~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:463:6: warning: no previous prototype for 'ne6x_reg_lock' [-Wmissing-prototypes]
     463 | void ne6x_reg_lock(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:468:6: warning: no previous prototype for 'ne6x_reg_unlock' [-Wmissing-prototypes]
     468 | void ne6x_reg_unlock(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:507:5: warning: no previous prototype for 'ne6x_reg_axi_read' [-Wmissing-prototypes]
     507 | u32 ne6x_reg_axi_read(struct ne6x_pf *pf, u32 offset)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:521:6: warning: no previous prototype for 'ne6x_reg_axi_write' [-Wmissing-prototypes]
     521 | void ne6x_reg_axi_write(struct ne6x_pf *pf, u32 offset, u32 value)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:530:5: warning: no previous prototype for '_reg_apb_read' [-Wmissing-prototypes]
     530 | u32 _reg_apb_read(struct ne6x_pf *pf, u64 offset)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:546:6: warning: no previous prototype for '_reg_apb_write' [-Wmissing-prototypes]
     546 | void _reg_apb_write(struct ne6x_pf *pf, u64 offset, u32 value)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:561:5: warning: no previous prototype for '_ne6x_reg_perform' [-Wmissing-prototypes]
     561 | int _ne6x_reg_perform(struct ne6x_pf *pf, u32 *data, u32 *pbuf, u32 len, u32 retlen)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:608:5: warning: no previous prototype for 'ne6x_reg_perform' [-Wmissing-prototypes]
     608 | int ne6x_reg_perform(struct ne6x_pf *pf, u32 *data, u32 *pbuf, u32 len, u32 retlen)
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:846:5: warning: no previous prototype for 'ne6x_reg_table_update' [-Wmissing-prototypes]
     846 | int ne6x_reg_table_update(struct ne6x_pf *pf, enum ne6x_reg_table table,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1058:5: warning: no previous prototype for 'ne6x_reg_mem_read' [-Wmissing-prototypes]
    1058 | int ne6x_reg_mem_read(struct ne6x_pf *pf, u32 addr, void *pbuf, u32 size)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1082:5: warning: no previous prototype for 'ne6x_reg_mem_write' [-Wmissing-prototypes]
    1082 | int ne6x_reg_mem_write(struct ne6x_pf *pf, u32 addr, void *pbuf, u32 size)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1253:5: warning: no previous prototype for 'ne6x_reg_set_user_data_template' [-Wmissing-prototypes]
    1253 | int ne6x_reg_set_user_data_template(struct ne6x_pf *pf, enum np_user_data type, u32 data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1274:5: warning: no previous prototype for 'ne6x_reg_get_user_data_template' [-Wmissing-prototypes]
    1274 | int ne6x_reg_get_user_data_template(struct ne6x_pf *pf, enum np_user_data type, u32 *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1391:6: warning: no previous prototype for 'ne6x_reg_send' [-Wmissing-prototypes]
    1391 | void ne6x_reg_send(struct ne6x_pf *pf, u32 cmd, u32 *data, u32 size)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1417:5: warning: no previous prototype for 'ne6x_reg_polling' [-Wmissing-prototypes]
    1417 | int ne6x_reg_polling(struct ne6x_pf *pf, u32 cmd, u32 *data, u32 buf_size,
         |     ^~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:70:7: warning: no previous prototype for 'my_strtok' [-Wmissing-prototypes]
      70 | char *my_strtok(char *p_in_string, char *p_in_delimit, char **pp_out_ret)
         |       ^~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:105:5: warning: no previous prototype for 'my_isdigit' [-Wmissing-prototypes]
     105 | int my_isdigit(char in_char)
         |     ^~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:113:5: warning: no previous prototype for 'my_atoi' [-Wmissing-prototypes]
     113 | int my_atoi(char *p_in_string)
         |     ^~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:142:6: warning: no previous prototype for 'ne6x_dbg_show_queue' [-Wmissing-prototypes]
     142 | void ne6x_dbg_show_queue(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:234:6: warning: no previous prototype for 'ne6x_dbg_show_ring' [-Wmissing-prototypes]
     234 | void ne6x_dbg_show_ring(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:314:6: warning: no previous prototype for 'ne6x_dbg_show_txtail' [-Wmissing-prototypes]
     314 | void ne6x_dbg_show_txtail(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:338:6: warning: no previous prototype for 'ne6x_dbg_show_txq' [-Wmissing-prototypes]
     338 | void ne6x_dbg_show_txq(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:363:6: warning: no previous prototype for 'ne6x_dbg_show_rxq' [-Wmissing-prototypes]
     363 | void ne6x_dbg_show_rxq(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:388:6: warning: no previous prototype for 'ne6x_dbg_show_cq' [-Wmissing-prototypes]
     388 | void ne6x_dbg_show_cq(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:413:6: warning: no previous prototype for 'ne6x_dbg_clean_queue' [-Wmissing-prototypes]
     413 | void ne6x_dbg_clean_queue(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:448:6: warning: no previous prototype for 'ne6x_dbg_show_txring' [-Wmissing-prototypes]
     448 | void ne6x_dbg_show_txring(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:496:6: warning: no previous prototype for 'ne6x_dbg_show_rxring' [-Wmissing-prototypes]
     496 | void ne6x_dbg_show_rxring(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:544:6: warning: no previous prototype for 'ne6x_dbg_show_cqring' [-Wmissing-prototypes]
     544 | void ne6x_dbg_show_cqring(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:587:6: warning: no previous prototype for 'ne6x_dbg_show_txdesc_states' [-Wmissing-prototypes]
     587 | void ne6x_dbg_show_txdesc_states(int adpt_num, int queue_num, struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:654:6: warning: no previous prototype for 'ne6x_dbg_show_rxdesc_states' [-Wmissing-prototypes]
     654 | void ne6x_dbg_show_rxdesc_states(int adpt_num, int queue_num, struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:701:6: warning: no previous prototype for 'ne6x_dbg_show_cqdesc_states' [-Wmissing-prototypes]
     701 | void ne6x_dbg_show_cqdesc_states(int adpt_num, int queue_num, struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:757:6: warning: no previous prototype for 'ne6x_dbg_show_arfs_cnt' [-Wmissing-prototypes]
     757 | void ne6x_dbg_show_arfs_cnt(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:783:6: warning: no previous prototype for 'ne6x_dbg_apb_read' [-Wmissing-prototypes]
     783 | void ne6x_dbg_apb_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:801:6: warning: no previous prototype for 'ne6x_dbg_apb_write' [-Wmissing-prototypes]
     801 | void ne6x_dbg_apb_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:819:6: warning: no previous prototype for 'ne6x_dbg_mem_read' [-Wmissing-prototypes]
     819 | void ne6x_dbg_mem_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:858:6: warning: no previous prototype for 'ne6x_dbg_mem_write' [-Wmissing-prototypes]
     858 | void ne6x_dbg_mem_write(struct ne6x_pf *pf, char *cmd_buf, int count) {}
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:860:6: warning: no previous prototype for 'ne6x_dbg_templ_help' [-Wmissing-prototypes]
     860 | void ne6x_dbg_templ_help(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:880:6: warning: no previous prototype for 'ne6x_dbg_templ_read' [-Wmissing-prototypes]
     880 | void ne6x_dbg_templ_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:897:6: warning: no previous prototype for 'ne6x_dbg_templ_write' [-Wmissing-prototypes]
     897 | void ne6x_dbg_templ_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:914:6: warning: no previous prototype for 'ne6x_dbg_soc_read' [-Wmissing-prototypes]
     914 | void ne6x_dbg_soc_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:930:6: warning: no previous prototype for 'ne6x_dbg_soc_write' [-Wmissing-prototypes]
     930 | void ne6x_dbg_soc_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:946:6: warning: no previous prototype for 'ne6x_dbg_tab_read' [-Wmissing-prototypes]
     946 | void ne6x_dbg_tab_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1010:6: warning: no previous prototype for 'ne6x_dbg_set_mac_to_eeprom' [-Wmissing-prototypes]
    1010 | void ne6x_dbg_set_mac_to_eeprom(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1054:6: warning: no previous prototype for 'ne6x_dbg_get_mac' [-Wmissing-prototypes]
    1054 | void ne6x_dbg_get_mac(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1085:6: warning: no previous prototype for 'ne6x_dbg_set_dev_type_to_eeprom' [-Wmissing-prototypes]
    1085 | void ne6x_dbg_set_dev_type_to_eeprom(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1145:6: warning: no previous prototype for 'ne6x_dbg_tab_write' [-Wmissing-prototypes]
    1145 | void ne6x_dbg_tab_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1205:6: warning: no previous prototype for 'ne6x_dbg_tab_insert' [-Wmissing-prototypes]
    1205 | void ne6x_dbg_tab_insert(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1275:6: warning: no previous prototype for 'ne6x_dbg_tab_delete' [-Wmissing-prototypes]
    1275 | void ne6x_dbg_tab_delete(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1329:6: warning: no previous prototype for 'ne6x_dbg_tab_search' [-Wmissing-prototypes]
    1329 | void ne6x_dbg_tab_search(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1401:6: warning: no previous prototype for 'ne6x_dbg_get_fru_info' [-Wmissing-prototypes]
    1401 | void ne6x_dbg_get_fru_info(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1432:5: warning: no previous prototype for 'getparam' [-Wmissing-prototypes]
    1432 | u32 getparam(char *cmd_buf, u32 *param, int max_cnt)
         |     ^~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1489:6: warning: no previous prototype for 'ne6x_dbg_show_pcie_drop_counter' [-Wmissing-prototypes]
    1489 | void ne6x_dbg_show_pcie_drop_counter(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1500:6: warning: no previous prototype for 'ne6x_dbg_clr_table' [-Wmissing-prototypes]
    1500 | void ne6x_dbg_clr_table(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: In function 'ne6x_dbg_clr_table':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1502:27: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
    1502 |         u32 table_id = 0, cnt;
         |                           ^~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: At top level:
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1509:6: warning: no previous prototype for 'ne6x_dbg_set_hw_flag_eeprom' [-Wmissing-prototypes]
    1509 | void ne6x_dbg_set_hw_flag_eeprom(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1532:6: warning: no previous prototype for 'ne6x_dbg_erase_norflash' [-Wmissing-prototypes]
    1532 | void ne6x_dbg_erase_norflash(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1550:6: warning: no previous prototype for 'ne6x_dbg_write_norflash' [-Wmissing-prototypes]
    1550 | void ne6x_dbg_write_norflash(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1593:6: warning: no previous prototype for 'ne6x_dbg_read_norflash' [-Wmissing-prototypes]
    1593 | void ne6x_dbg_read_norflash(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1620:6: warning: no previous prototype for 'ne6x_dbg_meter_write' [-Wmissing-prototypes]
    1620 | void ne6x_dbg_meter_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1995:6: warning: no previous prototype for 'ne6x_dbg_update_adpt_speed' [-Wmissing-prototypes]
    1995 | void ne6x_dbg_update_adpt_speed(struct ne6x_adapter *adpt, u32 speed, u32 lane_mode) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: In function 'ne6x_dbg_info_pnsn_read':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1840:23: warning: 'sprintf' argument 3 overlaps destination object '<unknown>' [-Wrestrict]
    1840 |                 len = sprintf(name, "%s[PN] Part number: %s\n", name, pru_pn);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1844:23: warning: 'sprintf' argument 3 overlaps destination object '<unknown>' [-Wrestrict]
    1844 |                 len = sprintf(name, "%s[SN] Serial number: %s\n", name, pru_sn);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:11:6: warning: no previous prototype for 'ne6x_clear_vf_status' [-Wmissing-prototypes]
      11 | void ne6x_clear_vf_status(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:21:6: warning: no previous prototype for 'ne6x_mbx_deinit_snapshot' [-Wmissing-prototypes]
      21 | void ne6x_mbx_deinit_snapshot(struct ne6x_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:30:5: warning: no previous prototype for 'ne6x_mbx_init_snapshot' [-Wmissing-prototypes]
      30 | int ne6x_mbx_init_snapshot(struct ne6x_hw *hw, u16 vf_count)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:55:5: warning: no previous prototype for 'ne6x_status_to_errno' [-Wmissing-prototypes]
      55 | int ne6x_status_to_errno(int err)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:63:6: warning: no previous prototype for 'ne6x_set_vf_state_qs_dis' [-Wmissing-prototypes]
      63 | void ne6x_set_vf_state_qs_dis(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:75:6: warning: no previous prototype for 'ne6x_is_reset_in_progress' [-Wmissing-prototypes]
      75 | bool ne6x_is_reset_in_progress(unsigned long *state)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:83:6: warning: no previous prototype for 'ne6x_adpt_close_vf' [-Wmissing-prototypes]
      83 | void ne6x_adpt_close_vf(struct ne6x_adapter *adpt, u16 vf_id)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:163:5: warning: no previous prototype for 'ne6x_adpt_release_vf' [-Wmissing-prototypes]
     163 | int ne6x_adpt_release_vf(struct ne6x_adapter *adpt, u16 vf_id)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:243:6: warning: no previous prototype for 'ne6x_free_vfs' [-Wmissing-prototypes]
     243 | void ne6x_free_vfs(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:368:6: warning: no previous prototype for 'ne6x_vc_set_default_allowlist' [-Wmissing-prototypes]
     368 | void ne6x_vc_set_default_allowlist(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:392:6: warning: no previous prototype for 'ne6x_send_init_mbx_mesg' [-Wmissing-prototypes]
     392 | void ne6x_send_init_mbx_mesg(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:487:22: warning: no previous prototype for 'ne6x_adpt_setup_vf' [-Wmissing-prototypes]
     487 | struct ne6x_adapter *ne6x_adpt_setup_vf(struct ne6x_pf *pf, u16 vf_id, u16 num_vfs)
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: In function 'ne6x_init_vf_adpt_res':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:524:24: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
     524 |         struct device *dev;
         |                        ^~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: At top level:
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:937:5: warning: no previous prototype for 'ne6x_sdk_send_msg_to_vf' [-Wmissing-prototypes]
     937 | int ne6x_sdk_send_msg_to_vf(struct ne6x_hw *hw, u16 vfid, u32 v_opcode,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1319:5: warning: no previous prototype for 'ne6x_conv_link_speed_to_virtchnl' [-Wmissing-prototypes]
    1319 | u32 ne6x_conv_link_speed_to_virtchnl(bool adv_link_support, u16 link_speed)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1355:6: warning: no previous prototype for 'ne6x_vc_notify_vf_link_state' [-Wmissing-prototypes]
    1355 | void ne6x_vc_notify_vf_link_state(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1439:6: warning: no previous prototype for 'ne6x_reset_vf' [-Wmissing-prototypes]
    1439 | bool ne6x_reset_vf(struct ne6x_vf *vf, bool is_vflr)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: In function 'ne6x_vc_reset_vf_msg':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1842:36: warning: variable 'vc_ether_addr' set but not used [-Wunused-but-set-variable]
    1842 |         struct virtchnl_ether_addr vc_ether_addr;
         |                                    ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: At top level:
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:2236:5: warning: no previous prototype for 'ne6x_set_vf_bw_for_max_vpnum' [-Wmissing-prototypes]
    2236 | int ne6x_set_vf_bw_for_max_vpnum(struct ne6x_pf *pf, int vf_id, int max_tx_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +426 drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c

   419	
   420	static void ne6x_get_priv_flag_strings(struct net_device *netdev, u8 *data)
   421	{
   422		unsigned int i;
   423		u8 *p = data;
   424	
   425		for (i = 0; i < NE6X_PRIV_FLAG_ARRAY_SIZE; i++) {
 > 426			snprintf(p, ETH_GSTRING_LEN, "%s", ne6x_gstrings_priv_flags[i].name);
   427			p += ETH_GSTRING_LEN;
   428		}
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
