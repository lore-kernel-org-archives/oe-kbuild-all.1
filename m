Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792428C0B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735337333; cv=none; b=t2MATymEwEZz1je7zF8elCKD8BQ0Lx4w/TT2Pspkf77FXTpVJzNOftQkYOBoSwfcrRmcAWerENG6Y++VFd7N/oai8jmWlPU2fASsxnO8dLvbvBUwD8X/iKBJH5EB3qwgt/PoqM92MRTOPCUoZhtLKSN4B5iTCh5biB0TY8X8+lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735337333; c=relaxed/simple;
	bh=y0Dy82pYiXBE6cyhlaThrZwD8+v62Qb4TIUbPr+Q3CY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfkVvLf5PE5tA797V5LreTtqt4uxxMLXybw2/ncI7DKb+T5Q3TIWdJnO/TN/rvL4Y2Xs6jxiIlrk+EQZ9lJhPFa0Bq478rqBh61T5mO2GmzWLz6i8s7Rzrre0Xmvs7Nr0CP2v8Sg9kq1FS2L4tu2erq1tVIL8ydwgfriE8lW8kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alTQbcKb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alTQbcKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735337332; x=1766873332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y0Dy82pYiXBE6cyhlaThrZwD8+v62Qb4TIUbPr+Q3CY=;
  b=alTQbcKbQhHouWvPkTdrieIZFfvrKtW7VwL+bY+h0tMzrMm8IqY8bGP6
   33esWV06nSfqrpCz9XZluRlByuomHtMfGFBWuOrJX5h08WXDSu6VfEJrp
   +mvEYTIlfLVEJvTSUSz3yOxO3OtPLHozp8f/h8mmubbQ14u35jmYW1+G+
   TZo2AK/GiEPzuOd7+QOxk5s4LWORO7KLp6QtXRb1FZeaHP4pHyOkYvEPf
   ZcGjkdBb6fpMlhSy/y9WMyi9fNIfqZBivqUAlqY7RF0Kug0116Lzq2VMj
   qOIpzJh2tarsRnG9IzpZYpYEzRGALydFL3bR0lcQBAhyxRjlWT4JfMWDf
   g==;
X-CSE-ConnectionGUID: nFak3jWbTyKPvPCdCglYbw==
X-CSE-MsgGUID: mCA+FSR7RsyMVjtQEZMksg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39668493"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="39668493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 14:08:51 -0800
X-CSE-ConnectionGUID: xUXbnw1aTkCX1uV6NPsl9w==
X-CSE-MsgGUID: zOTOE0DvRzm+tgvIvp43ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123530594"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Dec 2024 14:08:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRIVk-0003fs-08;
	Fri, 27 Dec 2024 22:08:48 +0000
Date: Sat, 28 Dec 2024 06:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 34/48] fs/smb/client/smb1ops.c:1105:42: sparse: sparse:
 cast to restricted __le32
Message-ID: <202412280617.XlXLExtI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   cc26137de51202e7210b058f6696393f1e006d46
commit: b6ad9c20119706b30484a17d7e7787cb12212121 [34/48] cifs: Implement is_network_name_deleted for SMB1
config: x86_64-randconfig-123-20241225 (https://download.01.org/0day-ci/archive/20241228/202412280617.XlXLExtI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280617.XlXLExtI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280617.XlXLExtI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/smb1ops.c:1105:42: sparse: sparse: cast to restricted __le32

vim +1105 fs/smb/client/smb1ops.c

  1079	
  1080	static bool
  1081	cifs_is_network_name_deleted(char *buf, struct TCP_Server_Info *server)
  1082	{
  1083		struct smb_hdr *shdr = (struct smb_hdr *)buf;
  1084		struct TCP_Server_Info *pserver;
  1085		struct cifs_ses *ses;
  1086		struct cifs_tcon *tcon;
  1087	
  1088		if (shdr->Flags2 & SMBFLG2_ERR_STATUS) {
  1089			if (shdr->Status.CifsError != cpu_to_le32(NT_STATUS_NETWORK_NAME_DELETED))
  1090				return false;
  1091		} else {
  1092			if (shdr->Status.DosError.ErrorClass != ERRSRV ||
  1093			    shdr->Status.DosError.Error != cpu_to_le16(ERRinvtid))
  1094				return false;
  1095		}
  1096	
  1097		/* If server is a channel, select the primary channel */
  1098		pserver = SERVER_IS_CHAN(server) ? server->primary_server : server;
  1099	
  1100		spin_lock(&cifs_tcp_ses_lock);
  1101		list_for_each_entry(ses, &pserver->smb_ses_list, smb_ses_list) {
  1102			if (cifs_ses_exiting(ses))
  1103				continue;
  1104			list_for_each_entry(tcon, &ses->tcon_list, tcon_list) {
> 1105				if (tcon->tid == le32_to_cpu(shdr->Tid)) {
  1106					spin_lock(&tcon->tc_lock);
  1107					tcon->need_reconnect = true;
  1108					spin_unlock(&tcon->tc_lock);
  1109					spin_unlock(&cifs_tcp_ses_lock);
  1110					pr_warn_once("Server share %s deleted.\n",
  1111						     tcon->tree_name);
  1112					return true;
  1113				}
  1114			}
  1115		}
  1116		spin_unlock(&cifs_tcp_ses_lock);
  1117	
  1118		return false;
  1119	}
  1120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
