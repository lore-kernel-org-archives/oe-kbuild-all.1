Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B2217F3D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086764; cv=none; b=qg8MXZnFROtCdfl+3JpmuTy3r3PNqAiId4tHiwWEFVll32E4iGgJcLHGOEnLtS/2Oe/Y6wW6l43YXXVouKHx8BOZWwZ/15biXAcaAxCbICLuy84Mpx30JNN5Yvp08dsyhO4e1QK/8HZvRinFy9hGSvBzpwzkdeYtW7tUDW/B/yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086764; c=relaxed/simple;
	bh=bBLBi+/uszXJrNS0RExv+HyTwvtK2Dqw8vfB6OTf6tQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=prnneCDyK8Jg8YN3zcL9A0tHz5o2rPxXvkKIpmYaXCnkTckHky5ITEwnDeSPur6gzixYvCxF6hqpjYL1u9mlREJ+9SdwuHydsSBoD/iGG6RdLKfK8dU2+t1TbsHtPQFtnjdaDmegay19svjaNm4lW/969K/efU4alnD9HJ/EkMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85e6b977ef2so199256839f.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 07:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086762; x=1743691562;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O31EDqZnf42bmiyYjE9Gv1Kig77RT2Jp/txzXzrDTBI=;
        b=sH1wDIaZgAm/ZmuOHnHaB96SS0I8BH/gCwVdriPZ1FzvpFi77izyIGHJ1oKB/Xu+C+
         EZibI9YEXrcJQ4egmM20u+fNsZTNkq9HrjImHYkZB1GdbbkVu6yBUscrUKx8o0ImtTJD
         0WLa4SMAWALF3gJ10Q4HdRRz9wsKMGobl98Pk2xTVpzIGlw82PQoJpILHBESWFCNEsnm
         1kLZ0QaGVRUNpo1YBTFmSuq/XV+7RmmLn0PCtm7I2U7lCcG4fceNcoTwLHKpXVkxkFem
         gnOEU29C1/uBL2T2CeywB/Apji1A/hnYbr8nlZBAMCIRQZJyk/c/G3WuUJdfq/mFhQSz
         SKuw==
X-Forwarded-Encrypted: i=1; AJvYcCVAPnoKRBs7n5MjCz+k3b9AAYXtl4unu4WzkIXjO9B1xmYn6qugaTAM9P3dfBDbTekTQO7up5EHj0pMSFhI@lists.linux.dev
X-Gm-Message-State: AOJu0YxA2K7I1I4n9QoRCwIywx4xOIYta6WVtJH88Y8CIhaxzvOwLKu5
	djldRK0DVMHgLlsI+jTuQ4yxrnAEFhHXTo99kiZM7AtvUgudt4inQo4TEgxdsa8I7JJb4ymrGn3
	STWiBwjQpm+4C4Aa9AmbBlo6G9QIOHdZ8EfGWzeHrzsu3qILXrnAKd0U=
X-Google-Smtp-Source: AGHT+IH3/YAoWyMyOT2ZmZKztUVHp0JJQajrmaritGZ7UtKATN1DB+AKdKLwXrPb1fsB9Cnl/8Zof7ODuhfQc/4UsqLHRutL++np
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1646:b0:3d3:dfc2:912f with SMTP id
 e9e14a558f8ab-3d5ccdd1496mr40599045ab.7.1743086762074; Thu, 27 Mar 2025
 07:46:02 -0700 (PDT)
Date: Thu, 27 Mar 2025 07:46:02 -0700
In-Reply-To: <Z-ViZoezAdjY8TC-@mini-arch>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e564aa.050a0220.2f068f.0031.GAE@google.com>
Subject: Re: [syzbot] [x25?] possible deadlock in lapbeth_device_event
From: syzbot <syzbot+377b71db585c9c705f8e@syzkaller.appspotmail.com>
To: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	eric.dumazet@gmail.com, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-x25@vger.kernel.org, lkp@intel.com, 
	llvm@lists.linux.dev, ms@dev.tdt.de, netdev@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, pabeni@redhat.com, sdf@fomichev.me, 
	stfomichev@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/net/wan/lapbether.c:376:36: error: 'netdev' undeclared (first use in this function); did you mean 'net_eq'?


Tested on:

commit:         1a9239bb Merge tag 'net-next-6.15' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=95c3bbe7ce8436a7
dashboard link: https://syzkaller.appspot.com/bug?extid=377b71db585c9c705f8e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15a66bb0580000

