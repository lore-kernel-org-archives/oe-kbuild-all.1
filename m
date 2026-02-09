Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0743093CF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770644834; cv=none; b=FelfXmHqwtRuMrukTBuTXcb0VMF5B6/yR2f0BTU+KaMuIwQDgn0dPkt58LQ4aBIrzB0ombiDgGgiRNwFw1rabEy1zsJtQWaON7EVv+un0AiX4bQhKNt+HqNHXw4gjkd1eGJ9aKI2TwayeSlxIYxQgtH+xq55XUOCtx1gKyw5Bhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770644834; c=relaxed/simple;
	bh=2TSC0eCcAeKAZ/rLBUVEoTKkLpcpnibSGvMRXLg5ceo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWD/2mTYM2ddlUGLOG81GaGq8BfQkVy/QjJdH0NaXWcG2++PblFG8DtmghwYzp4wjPUHQwJVq7c3zJFbcmOGhkxfK5IbjognBouRAEwV8ZTAPcUku9BEL0PGTW7AWfWzTrKDyYXqZb7NME8J5yeo/YQaNLQ/VwssPnSDTxe/sEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=S4okE9gP; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="S4okE9gP"
Message-ID: <d248f263-362d-45a2-9390-ab2dd59263e7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770644830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNXUIccVNXHwrDOZP6TiEUwf8s2xqnYTqC+yQHypkW8=;
	b=S4okE9gPVRxveNsOup9Yid6PEBs88dSrUencKKeh4ERnZBcWBrRxaXtKjp8hiYkMQO04oJ
	v5QTYa7t3IzDpArDgQzROu4VbG8ciQmmBzyxqFzt+8m8LVSxGdpXBuDed2Vpm2y6XoSBLJ
	aXWwMgx870OAFtylbCKi7jGqLXyWCr8=
Date: Mon, 9 Feb 2026 21:47:01 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [cifs:for-next 51/73] make[6]: *** No rule to make target
 'fs/smb/client/fs/smb/common/smb2status.h', needed by
 'fs/smb/client/smb2_mapping_table.c'.
To: kernel test robot <lkp@intel.com>, David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Steve French <stfrench@microsoft.com>,
 chenxiaosong@kylinos.cn
References: <202602071842.fYfRGNxU-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: ChenXiaoSong <chenxiaosong.chenxiaosong@linux.dev>
In-Reply-To: <202602071842.fYfRGNxU-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

It builds successfully on Fedora 43 (gcc 15.2.1), I will install a 
Debian tomorrow and try building with gcc 12.

mkdir build_dir
wget -O build_dir/.config 
https://download.01.org/0day-ci/archive/20260207/202602071842.fYfRGNxU-lkp@intel.com/config
make W=1 O=build_dir ARCH=i386 olddefconfig
make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

Thanks,
ChenXiaoSong <chenxiaosong@kylinos.cn>

On 2026/2/7 18:32, kernel test robot wrote:
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> head:   7533749b93e943b80d9dc4c627f1193dbac6b5f3
> commit: 9fc8c17aa9cf5e4b50d35a14b65f7d5165bae966 [51/73] cifs: Autogenerate SMB2 error mapping table
> config: i386-randconfig-013-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071842.fYfRGNxU-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071842.fYfRGNxU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602071842.fYfRGNxU-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> make[6]: *** No rule to make target 'fs/smb/client/fs/smb/common/smb2status.h', needed by 'fs/smb/client/smb2_mapping_table.c'.
>     make[6]: Target 'fs/smb/client/' not remade because of errors.
> 
