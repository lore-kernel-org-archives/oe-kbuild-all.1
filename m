Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2062233E34C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219795; cv=none; b=pzEqFSgOTE9kPX9H8XAtm/byvL4/z143tb10/zY1rbziBZVWuA8g6mXA3aJ00K3mYMBc3DOlwnSjefP0g2LkpKd2P/v4FFj16K5/LO2Zs4G8PF3LMeHPPoFtQTfwoNbtLlEUQdngzemcPSoWdYcfW43li95V+grOTSrPc6qzfHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219795; c=relaxed/simple;
	bh=5CyUkjph43fB+ccDJy0Q9RR5T72unV7zy56vo163I7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mC5DcsNL6wy42BF//vZ2p0dOPiZ6qiulFAXyWR/xe2KzNZQYckBCFl2uGhuLYF8L08qK4/dmTEcgndqz7X0PqwKn1wZHSD0QZrYvSV6qw/S6WTDbxp87SFD/MXGFp+qC5ZHuwp7dGOzwlf/A9gBtmbI3giDR7lKuFReYHouM5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=B1EVg1G6; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="B1EVg1G6"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nd1E68KFDN641HxS0Qv9w9xq/rjL/Ksfgy874Dks9LE=;
	b=B1EVg1G6F4yvZCGuVaT1xOQH3kuzf+DMAw0zbYgmZMSwxEO78PnBywXAEk6KInOzpJqatwR5M
	xRp2CfrdbSA9tUmacr+d6IA7Lh0+VmNVyYHA63zwASQnRNIzkaXF8T/wu2T8sYq6KNDDcNaxOdw
	xWXirqG11V8lOX9LdUIRBsA=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dqWLs070tz1prL8;
	Mon, 12 Jan 2026 20:06:29 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 713BC40539;
	Mon, 12 Jan 2026 20:09:49 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.254) by dggpemf500013.china.huawei.com
 (7.185.36.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 12 Jan
 2026 20:09:48 +0800
Message-ID: <dbed961f-f3c3-496b-9498-6821852da038@huawei.com>
Date: Mon, 12 Jan 2026 20:09:47 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: {standard input}:4155: Error: pcrel offset for branch to .LS000B
 too far (0x38)
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, Zhang Yi <yi.zhang@huawei.com>, Jan Kara
	<jack@suse.cz>, Ojaswin Mujoo <ojaswin@linux.ibm.com>
References: <202601121758.kA3osRht-lkp@intel.com>
Content-Language: en-GB
From: Baokun Li <libaokun1@huawei.com>
In-Reply-To: <202601121758.kA3osRht-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500013.china.huawei.com (7.185.36.188)

On 2026-01-12 17:42, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0f61b1860cc3f52aef9036d7235ed1f017632193
> commit: a6d73242b8b5caa9f9a529eab49cc1e85ace9890 ext4: support large block size in ext4_mpage_readpages()
> date:   6 weeks ago
> config: csky-randconfig-001-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121758.kA3osRht-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121758.kA3osRht-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601121758.kA3osRht-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    {standard input}: Assembler messages:
>>> {standard input}:4155: Error: pcrel offset for branch to .LS000B too far (0x38)

Hi,

Thanks for the report.

After looking into this issue, it turns out that replacing the original
calculation with the macro version causes the compiler to emit a larger
sequence of instructions.

On most architectures this is harmless, because their GCC backends support
proper branch relaxation and can automatically promote a short branch to
a long branch when the offset grows.

However, the CSKY GCC backend does not implement branch relaxation. As a
result, once the generated basic block becomes slightly larger, some short
branch instructions can no longer reach their targets, and the assembler
reports the “pcrel offset too far” error.

Given this, one possible workaround on the kernel side would be to replace
the macro with a static inline helper. Using an inline function allows GCC
to perform more aggressive optimization and typically avoids generating
unnecessarily large instruction sequences, which helps prevent the
short-branch overflow seen on CSKY.

However, the more general and robust solution would be to improve the
CSKY GCC backend so that it supports proper branch relaxation, as other
architectures do. With branch relaxation in place, these issues would not
depend on how the code is written.

We’d appreciate any thoughts on which approach makes more sense.


Thanks,
Baokun

