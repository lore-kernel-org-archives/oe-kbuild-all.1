Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04A815278E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 19:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736710841; cv=none; b=cxuO7zIbeCbPFgK2IDveOKbQnFu//5qkmg7Ab1TO+NYBNlbEy336ps/tSPWIW0Vd54oK3DNSvIN4QZ7pgfzF1IIJH8WVJYxx3sjVVNJ5XHpIcp347fPkUa3YjLt9bH0S/+ZDRIwEnSCPtK/fObw9noxWRLLYq/RKPL9hjqyOSFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736710841; c=relaxed/simple;
	bh=QmxaaU7j+wgINjt89Qxa0hewTyYsU9tufLrFrisYXaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J17UtAle5cqLJupiQRxugoLhEvcYVst8ylXZMZEhEk2Nln0LVtGh4f/79TfHX9SFjiBzVVT9uTA6pVAi/rt+rP1U9Y0F1yX+EABiMOY/awYwTrpE38TeKlN53miP/mroSn6T9y14D102zchXSSOqFqqM2RE6qytIxhs0gWlqv4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4F3xd/2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4F3xd/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736710839; x=1768246839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QmxaaU7j+wgINjt89Qxa0hewTyYsU9tufLrFrisYXaQ=;
  b=O4F3xd/2psba9mhlCbjKXXLfhTkki1g/9DmfVqEhvQeUoa2xHa3ndHX0
   Y4LiKieTOveHQo7xjVGDGblJ1CD22wahV/9zcDc0W67tE6YTK7KepzCP8
   0GsKolI0440d+AIcZuvyLZL+IOZJdNI8wtfyfOPiMGUEIjX5wS6sw7GOt
   VqYudz1VgjcikiVCrvotPkQpoJoxBBK97MNt2BZLOCM/wvLsN1PZpHemY
   KDJPIOrcYqDSaZ6IQmFdMfplWr8ay8k8ihj/hXa2oJdFkWWpaEAVPcaVg
   FgNV34bBXloCM/UxfJ3lMEazNiyJnWEM2I4FxZdJ6yiL/iV2N/Xd+E6zT
   g==;
X-CSE-ConnectionGUID: 0WNSIfEzQ9qDQ6H8FJvC5g==
X-CSE-MsgGUID: qboek47sSbWRNj84Sl5CLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48351721"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="48351721"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 11:40:38 -0800
X-CSE-ConnectionGUID: meavDUFSTHuxjoMyDct5Mg==
X-CSE-MsgGUID: rzzfmzJmQTKcBwxLnGzYKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="104737280"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jan 2025 11:40:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX3p1-000MLH-1l;
	Sun, 12 Jan 2025 19:40:31 +0000
Date: Mon, 13 Jan 2025 03:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>
Subject: [linux-nvme:nvme-6.14 29/35] drivers/nvme/host/auth.c:742:2-3:
 Unneeded semicolon
Message-ID: <202501130310.A2dr9hU5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.14
head:   6d84dae9af94be43bb71d24353aef102fd0744da
commit: b68527338ba3882e43bae078c1bd4de0f55c6ce3 [29/35] nvme-tcp: request secure channel concatenation
config: arc-randconfig-r054-20250112 (https://download.01.org/0day-ci/archive/20250113/202501130310.A2dr9hU5-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501130310.A2dr9hU5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/host/auth.c:742:2-3: Unneeded semicolon
   drivers/nvme/host/auth.c:751:2-3: Unneeded semicolon

vim +742 drivers/nvme/host/auth.c

   699	
   700	static int nvme_auth_secure_concat(struct nvme_ctrl *ctrl,
   701					   struct nvme_dhchap_queue_context *chap)
   702	{
   703		u8 *psk, *digest, *tls_psk;
   704		struct key *tls_key;
   705		size_t psk_len;
   706		int ret = 0;
   707	
   708		if (!chap->sess_key) {
   709			dev_warn(ctrl->device,
   710				 "%s: qid %d no session key negotiated\n",
   711				 __func__, chap->qid);
   712			return -ENOKEY;
   713		}
   714	
   715		if (chap->qid) {
   716			dev_warn(ctrl->device,
   717				 "qid %d: secure concatenation not supported on I/O queues\n",
   718				 chap->qid);
   719			return -EINVAL;
   720		}
   721		ret = nvme_auth_generate_psk(chap->hash_id, chap->sess_key,
   722					     chap->sess_key_len,
   723					     chap->c1, chap->c2,
   724					     chap->hash_len, &psk, &psk_len);
   725		if (ret) {
   726			dev_warn(ctrl->device,
   727				 "%s: qid %d failed to generate PSK, error %d\n",
   728				 __func__, chap->qid, ret);
   729			return ret;
   730		}
   731		dev_dbg(ctrl->device,
   732			  "%s: generated psk %*ph\n", __func__, (int)psk_len, psk);
   733	
   734		ret = nvme_auth_generate_digest(chap->hash_id, psk, psk_len,
   735						ctrl->opts->subsysnqn,
   736						ctrl->opts->host->nqn, &digest);
   737		if (ret) {
   738			dev_warn(ctrl->device,
   739				 "%s: qid %d failed to generate digest, error %d\n",
   740				 __func__, chap->qid, ret);
   741			goto out_free_psk;
 > 742		};
   743		dev_dbg(ctrl->device, "%s: generated digest %s\n",
   744			 __func__, digest);
   745		ret = nvme_auth_derive_tls_psk(chap->hash_id, psk, psk_len, digest, &tls_psk);
   746		if (ret) {
   747			dev_warn(ctrl->device,
   748				 "%s: qid %d failed to derive TLS psk, error %d\n",
   749				 __func__, chap->qid, ret);
   750			goto out_free_digest;
   751		};
   752	
   753		tls_key = nvme_tls_psk_refresh(ctrl->opts->keyring, ctrl->opts->host->nqn,
   754					       ctrl->opts->subsysnqn, chap->hash_id,
   755					       tls_psk, psk_len, digest);
   756		if (IS_ERR(tls_key)) {
   757			ret = PTR_ERR(tls_key);
   758			dev_warn(ctrl->device,
   759				 "%s: qid %d failed to insert generated key, error %d\n",
   760				 __func__, chap->qid, ret);
   761			tls_key = NULL;
   762		}
   763		kfree_sensitive(tls_psk);
   764		if (ctrl->opts->tls_key)
   765			nvme_auth_revoke_tls_key(ctrl);
   766		ctrl->opts->tls_key = tls_key;
   767	out_free_digest:
   768		kfree_sensitive(digest);
   769	out_free_psk:
   770		kfree_sensitive(psk);
   771		return ret;
   772	}
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
