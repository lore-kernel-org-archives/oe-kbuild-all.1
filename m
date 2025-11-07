Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF68B3009CB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 00:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762476605; cv=none; b=iKJ8aaT2WJHUPNpfUZxmGNx1HDDGapkVWPNRPY3UD5tYPvffeHYDccPBWR3erMbRKRzGhkzGjAB5DIAlEuvd2vezRKmoeI/9VQIFK6ss+O/tg/e40ImHsEsTajh+xI0tJSjYfQj5V7UL3e//HXvl2W0szez5vlNouIzoAzcIqfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762476605; c=relaxed/simple;
	bh=/uGxiUpVwBCUN3pD95xApGVngYUG2y+wBWn2neOR9RA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nJ4LgWyDRxuvBjUsRFbyjECMqtHSY74aeFDfayLdG0a+UtKULcq8372EZXnRMLtilCJxBSvT9NV7S0C5bPHd+pQrSvus7/dlvvM7ps/Wf4zOYkwcLqM9BBjFcquxHv7iC/YGc6rxGKw8cHDwpy/kVeB7NGPWHJOADNnK9/SJehc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-4332987de75so6218985ab.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 06 Nov 2025 16:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762476603; x=1763081403;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=scf9HvGkj6h9nQoDt/eHw462ipN6/I7qKBtgiEBj0/Q=;
        b=FF71gfaEH18YZNIDLIDke85UoSb2QkAmenCvY5JTq3cgi+TYwniNtP0vDZO6baytg7
         DVXK7eipxSrrd1Itv5Bxvk1tZrSRSjnS4c/lYuvBHuUpuWAjCXdK7RpofTyok1u6LgrY
         orngUwwUqqijcimt433iBnpM8IahvLJJsIDtHnODaxjQN1Fus2GQrsddU9Ty2PEj6h3X
         CIqvuwKzroV30ysnVvPURs0IGgxDsgsdcWPONJUFXOGDdcRnElI/KeZB+KG6OkEc8cVi
         2HupM+p69Gle8SFpOcqlWf20KAc7fJhp3aTZ0N4zENZKDSeMCrF8Y3xAldSFX39XwENV
         4cRw==
X-Forwarded-Encrypted: i=1; AJvYcCW7qhOUZ8DGTqWQpou3J3cZXCcRlpw7u2rIJZT9HO97OApLDiAFug5kcBb+SCUJ1ZBsRPE8dm4ZeOmRx6vr@lists.linux.dev
X-Gm-Message-State: AOJu0Yye4PDzj/R/Q0KBcMCa1Q+Qvj65IcOC//XmN1c91lzVi4LP7vjN
	+pcnjNOjH5YOfdvSOuZL/gXbKji9g8+9Rig5QFRDP+z+cJHLSb3oi/LMuBvkGfed2DPwlNH/ZZx
	r8VQAfbwj3+JNSR6gTVk8uyEqGeLtGEaxB0kUNAgwexj+eqGudT+nH2RL72w=
X-Google-Smtp-Source: AGHT+IHnFCEBkoL4JIf5R7Srt0Ir4FqM6VEIhsdO/2foJ1skJV7nN5HJ7sGRku8OoXDZDqtYlhQ4ivlCIsxA9YPSXakQPDFPPEjF
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c1:b0:433:1e74:9a52 with SMTP id
 e9e14a558f8ab-4335f53dd2dmr23233735ab.15.1762476603127; Thu, 06 Nov 2025
 16:50:03 -0800 (PST)
Date: Thu, 06 Nov 2025 16:50:03 -0800
In-Reply-To: <68dad4bb.a70a0220.10c4b.0086.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690d423b.a70a0220.22f260.0012.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KASAN: slab-out-of-bounds Read in bch2_btree_node_read_done
From: syzbot <syzbot+ba71155d3eacc8f42477@syzkaller.appspotmail.com>
To: eadavis@qq.com, kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit f2c61db29f277b9c80de92102fc532cc247495cd
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Sep 29 20:43:52 2025 +0000

    Remove bcachefs core code

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17012a58580000
start commit:   083fc6d7fa0d Merge tag 'sched-urgent-2025-09-26' of git://..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f5b21423ca3f0a96
dashboard link: https://syzkaller.appspot.com/bug?extid=ba71155d3eacc8f42477
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16433d34580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e79f12580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: Remove bcachefs core code

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
