Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B0B1AED4D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 08:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869471; cv=none; b=t2jJbJYdkTpZW/HJg6KkQvRAbAAJYO+ZwBOWqZGCi+i60dbLHDK/RHTUO3gi37lh9U4JhF7Pdm9wvLJKcqyzjRnbBwyBlNvVNT/1/IKUulH7nt4DePUjpFrWLICk4fdPLpircdOGFBVq8fXe2WFRqO03Y1A+YMZ8aMbN/kIfay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869471; c=relaxed/simple;
	bh=jIK7TGiD4/BCXGRxdv3SxMwpohsXjtO1oSWwru5WSyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3mzWw9F5bQ1E/jF51Iualk/Gfrlxsom/DMpZSQi4vu3TLNh4tk2kalXGZ5DRRY5Zf3pqP92HGNK9xPGHJjDx/cZgD5m1F3ZxdIjAMc+fLY3TvsT6kWIl1vRIKzGw1Dni/VYEt1KAsRruDDzEFzW+6pP8cbamVRDs6duAvrD1tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rYpYrVQs; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rYpYrVQs"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1725869460; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=bg+dw748Ekv41AIrUpXBncf6hBGJfcOCAV3mjvwBexk=;
	b=rYpYrVQsyTj7LDIdOgvhoDeHkyxgTmk/8DO5HSh3pkJI21/bHdUpucb4fCra67kIF581rSipWGsS8Xy6Sda1o6pI6IsL3hm3p9QeSZMeYRrUGTTKMaU7h+iafuqWlEMIhRw1YiNzYC/zrq0ozxSG7WR426ZbXC7Nd+iPkQhWgug=
Received: from 30.221.130.133(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WEZ5qAz_1725869458)
          by smtp.aliyun-inc.com;
          Mon, 09 Sep 2024 16:10:59 +0800
Message-ID: <7c5c3524-8559-4112-904b-d9308b8633f3@linux.alibaba.com>
Date: Mon, 9 Sep 2024 16:10:58 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xiang-erofs:dev-test 9/12] fs/erofs/inode.c:19:56: error: 'off'
 undeclared
To: kernel test robot <lkp@intel.com>, Yiyang Wu <toolmanp@tlmp.cc>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, Chao Yu <yuchao0@huawei.com>,
 Chao Yu <chao@kernel.org>
References: <202409091602.2XlSy6FO-lkp@intel.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <202409091602.2XlSy6FO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/9/9 16:07, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
> head:   c45b42bcbc9c3fb421b8a4f7b3112b401971530b
> commit: afcb9dd4a55ab82970251b75c2a5461025ed4d8a [9/12] erofs: refactor read_inode calling convention
> config: i386-buildonly-randconfig-003-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091602.2XlSy6FO-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091602.2XlSy6FO-lkp@intel.com/reproduce)
> 

It's a stale tree and already fixed.
