Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334441487F4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736237678; cv=none; b=k19pyE9QZrfhKL3OmpSgQ4SqKF2j9KevqkL954CV3qCx1LJ34wyXy1aRczIAu1/Pg0iko7N3EPhNuwsL53vh765tWVLBvhvLPZ7lWO2QGnw/+eAV/G5Z0YlxUMuu/jpm5pOgcAiELtpudfm2/dk//DkLKmI4lrQ0nEp65keqrm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736237678; c=relaxed/simple;
	bh=KW8CSi3Sk4+4dv/2hSfpqMBQsjqBC0nsKEyEjE0JBkw=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=HkNowgaiG0VGIqYxC/Zig4Hp+kVSdlOaJeplD1azxrUw+N/ysZt0dSbpNHb/5EKRrVU6s+xrQpD1W1IgYh+V617kWC/KZu7gdbjY8W6FDtz1lOruIrANWHy7boFNnQrajC+llFp0siNS6rBcghNAbRf3Wc2mmWtfi6l5SCzB1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=FlM98sVB; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="FlM98sVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oIppB2Qbo6uuv3jXCH5RwQ/oNkZ7r87UPApfiAIqLYo=;
  b=FlM98sVBHNctw8+Fmorc9MnXMT5EUFLYp/BE+H0efO///Q2TJraV7bz4
   lFnUIlfOYT9rgTKtkVQq9eGOp0QFNt3KVdoTOPwFkI3K64CCQ0r800XBx
   riV8eP5q6R5OXXf7ad/kd0EleS8funeAYsJ+51j6JmT6fXuzTUShDoDlj
   E=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="201746520"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 09:14:27 +0100
Date: Tue, 7 Jan 2025 09:14:26 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347] drivers/nvme/host/qmap.c:208:8-12:
 ERROR: invalid reference to the index variable of the iterator on line 202
 (fwd)
Message-ID: <bc63dabd-a6d1-cb3-2ff7-37a23c8c33a2@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hello,

Is there a guarantee that the break on line 204 will be taken?  If not, an
invalid pointer will be returned.  The NULL initialization of qmap is not
useful.  list_for_each_entry always initializes the first argument, even
if the list is empty.

julia

---------- Forwarded message ----------
Date: Tue, 7 Jan 2025 12:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bytedance:5.15-velinux 1347/1347] drivers/nvme/host/qmap.c:208:8-12:
    ERROR: invalid reference to the index variable of the iterator on line 202

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jason.zeng@intel.com
TO: lin.x.wang@intel.com
TO: pei.p.jia@intel.com

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 6e74a414cbefd3f08ab27d0e7ee5b56afa19a7f4 [1347/1347] bytedance: nvme-qmap: modify according advise
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-103-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071221.CmfPsaU3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501071221.CmfPsaU3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/host/qmap.c:208:8-12: ERROR: invalid reference to the index variable of the iterator on line 202

vim +208 drivers/nvme/host/qmap.c

3a9b973eb8419f dingtao.darren 2024-07-08  196
3a9b973eb8419f dingtao.darren 2024-07-08  197  struct nvme_qmap *nvme_qmap_get_qmap_from_ndev(struct nvme_dev *ndev)
3a9b973eb8419f dingtao.darren 2024-07-08  198  {
3a9b973eb8419f dingtao.darren 2024-07-08  199  	struct nvme_qmap *qmap = NULL;
3a9b973eb8419f dingtao.darren 2024-07-08  200
6e74a414cbefd3 dingtao.darren 2024-07-16  201  	down_read(&qmap_list.list_rwsem);
6e74a414cbefd3 dingtao.darren 2024-07-16 @202  	list_for_each_entry(qmap, &qmap_list.qmap_head, qmap_entry) {
3a9b973eb8419f dingtao.darren 2024-07-08  203  		if (qmap->nvme_dev == ndev)
6e74a414cbefd3 dingtao.darren 2024-07-16  204  			break;
3a9b973eb8419f dingtao.darren 2024-07-08  205  	}
6e74a414cbefd3 dingtao.darren 2024-07-16  206  	up_read(&qmap_list.list_rwsem);
6e74a414cbefd3 dingtao.darren 2024-07-16  207
6e74a414cbefd3 dingtao.darren 2024-07-16 @208  	return qmap;
3a9b973eb8419f dingtao.darren 2024-07-08  209  }
3a9b973eb8419f dingtao.darren 2024-07-08  210  EXPORT_SYMBOL_GPL(nvme_qmap_get_qmap_from_ndev);
3a9b973eb8419f dingtao.darren 2024-07-08  211

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
