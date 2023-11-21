Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B1014ABA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 03:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hHDzuPbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700535868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2grcs2rWzHb9qBsJYwUc4VAquVR8IwPBKlprjizeaOU=;
	b=hHDzuPbdTWDvcTF/BD3WwxYy8X13EoJu/mvcWVV7NLaQxR/pb/p+9esmMxos0oCl8KG7gu
	5F+c7HRbd1tysY0GwmNrN1uFz0Srk5AZc+oyoTCnIthfmW7OmoZwSx3G4tapTrV1b9Lc6q
	DGJehKrd8Yyv+yYa8JLLr0xoNH3x4y8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-xIZaviGINzC9ovKbejFUAw-1; Mon, 20 Nov 2023 22:04:24 -0500
X-MC-Unique: xIZaviGINzC9ovKbejFUAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E22D185A780;
	Tue, 21 Nov 2023 03:04:24 +0000 (UTC)
Received: from [10.22.8.109] (unknown [10.22.8.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4450BC1596F;
	Tue, 21 Nov 2023 03:04:24 +0000 (UTC)
Message-ID: <569119a8-f6f2-4e00-bfcc-5b804447320f@redhat.com>
Date: Mon, 20 Nov 2023 22:04:24 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel/cgroup/debug.c:1: warning: no structured comments found
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>
References: <202311211005.Qwt1FHrO-lkp@intel.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <202311211005.Qwt1FHrO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8


On 11/20/23 21:32, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
> commit: a28f8f5e995fe5964ae304444913536058f26e37 cgroup: Move debug cgroup to its own file
> date:   6 years ago
> config: i386-buildonly-randconfig-005-20231120 (https://download.01.org/0day-ci/archive/20231121/202311211005.Qwt1FHrO-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211005.Qwt1FHrO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311211005.Qwt1FHrO-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> kernel/cgroup/debug.c:1: warning: no structured comments found
>
> vim +1 kernel/cgroup/debug.c
>
>     > 1	#include <linux/ctype.h>
>       2	#include <linux/mm.h>
>       3	#include <linux/slab.h>
>       4	

Yes, there is no function in this file with structure comments. This 
debug controller is used for debugging only and is not supposed to be 
used on production systems anyway. Its interface is unstable and so I 
don't see a need to properly document its interface.

I will leave this file as it is for now.

Cheers,
Longman

