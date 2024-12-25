Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDCB190674
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 18:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735150041; cv=none; b=krJB2m31GTJwwi06cGCdt9xx40L+3TsL+jUlwoTywEOYYU387sIiHjd2AyyB+4eKacw8lCgaVsySSBXM06r7qwQn5X2p9Gf/33nnrKJBYhhdU6ovs1vSyA03+VKYDAYJq+zeATYnwcJ++Dz7kNjGsqgpNUZzkTKsAWA/GkeuTeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735150041; c=relaxed/simple;
	bh=R3SzdQa6pneCPlaWddnI6Hk/5qO1BSPOTyMvX24e6qk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxI1VePd0tmKUX79aNFgSd4yGbGTCtOg3WsA0ObloVR5M2sS6KumW13rvrqBLjWjI28dHYeFA4W053VF5sBcKj77ly5SwrVMleQmh9gPo2aM9vnWVSGOEZbNiQOoSsGEDglG3ChAp/CKIHCgn27J/IsOqSkOvLaBVKEkCmUnwxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqLvHphE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqLvHphE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735150039; x=1766686039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3SzdQa6pneCPlaWddnI6Hk/5qO1BSPOTyMvX24e6qk=;
  b=GqLvHphEO83GjZx3bmt0T5X2O+3koT/pEHOvrZu/v+U3JMvclI4skqqu
   IpT0JW/61KkJFlW1BYsJ/a4HM4mtn/WxGoucSrNX+tOAlqnbm/g+qexsz
   ubmxuDdgVNzWbjNE3YKbfbUZvqS9dux/0HZYO03ZXJ/vbbvaEehmLaiLe
   zUkydDZJjyEjDBq/BoLALINROK7MWdfJzbtQ2OpGql94OxHZERr1tL72a
   O+EcekRbDRw7jnoi/I0HvtRAy4AtVZ/yYR3p4JJ4wk4E+qNiDPbD1JXiK
   LtGRdLf9iN3D6PO0ZDiYy9pTOwFWj0ZjEIZvnG+nGTWE3tIPLOHVPA7en
   A==;
X-CSE-ConnectionGUID: k4mw+YoNRD2sKml3jt/30w==
X-CSE-MsgGUID: 13+Gf1Q9QUCRjrXpO3H1ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46077577"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="46077577"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 10:07:17 -0800
X-CSE-ConnectionGUID: R2rwgENqQSyf5NrmvNTAsw==
X-CSE-MsgGUID: vD3cXGw8QPig9DOpkSJ2Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100233615"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Dec 2024 10:07:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQVms-00023a-0F;
	Wed, 25 Dec 2024 18:07:14 +0000
Date: Thu, 26 Dec 2024 02:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 34/38] fs/smb/client/smb1ops.c:1105:42: sparse: sparse:
 cast to restricted __le32
Message-ID: <202412260156.l5ZD2TsT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   4a7fbaf556836b77fe7bb452939af3a505ee5ee9
commit: b6ad9c20119706b30484a17d7e7787cb12212121 [34/38] cifs: Implement is_network_name_deleted for SMB1
config: x86_64-randconfig-123-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260156.l5ZD2TsT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260156.l5ZD2TsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260156.l5ZD2TsT-lkp@intel.com/

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
