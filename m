Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEC53ABD98
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633512; cv=none; b=m5kOLoiYgqmHuLbRoWSRpvCmRQby4qeOlfWFmaV6aEQBWyCjjOVrFKdxxsjlectE4a9jxsEPZecQv0+4vO9pb2rI+KjBqXNgEvG2tADA18hGefsQ0gx14Jfcsq0SVHNt1tZN7SPht2YLMt4S4+6uQvnsjCB9QgLwYBdSVx2d/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633512; c=relaxed/simple;
	bh=xzCxCEzUowtsPxWMbDjD1lRzfaA5w83hr58sbAM2xcM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=C/AHcSCQnPE8VpivNjtGJRw95jP8p0Mtt8jZPQu3A5NC4UI12WBfYvwFGsi+o3fqJp10k9jVUkchdKmfLGyDWOeMh/OW3YXXKmG5QKLRTIzpUnNOFwFqjBweHnQRCLnYZ5yyeCwXUMnnDp0iFacZF59TOx4OA1/ztCrwQmYQB4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso494576b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 01:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633502; x=1790238302;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uBkL6ZMYYdQOBhaz18ohIP2qWIBpLXjs4rOb70E61hY=;
        b=xP8Hj5H6+At8t3DDibpB74lSX54WNi8zDRe7cCjAJ6BKufV2RgV3oq9AtwzQGzVPVI
         o1VTFTOCB4O38bB/AI0fpR8HYm93F57AIOPK7vWsYj93d5kjgmoCqpAXOfz7S/qHz8gG
         cMcB2XYOLHuwfMMIPgTnBxWT6mGZznBPBbqhQVZLVJLcj/ZaduRQXhrSh6OhhabFRrXm
         30EZaab8uBNDmZt98xMziHWu3nwqd624+jUWnwwIlhKveDtKBQl9u9YcdiK6NVJjHD9O
         klRvWffjm/804H/nt81fsYu2pU+UGpd7U/cP9waGsGDCxcX2zK2t0PY/gi4jRpDRsYwc
         hmbw==
X-Forwarded-Encrypted: i=1; AKwUvByz/mwQ4cYL4rh691BveU2uxMMveElhMGxDr9smE/hArHz4AdADsj7eCJ83cKP4noL27LzOmB8uXtUUjkVs@lists.linux.dev
X-Gm-Message-State: AFuF++lUgqRtxyfNVlR+siKoeIknU0l5AWJfTJNfSlwjtBmidFjuxGez
	Llh2OsF+PfGaeL5vwbVSei2wOrkPIqWNBHWEgU3/ThbxeKtiRvBTuYFBsVsUhkI6BLI8ZdEV3j+
	vFA0sPz/10X5hmFpwKtDKsFsfBmI4LoHZecedErFFtuwEUd5Z+BRLIw835NA=
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1692:b0:4c5:92fb:218d with SMTP id
 5614622812f47-4ca4be66e9dmr5399582b6e.22.1789633502228; Thu, 17 Sep 2026
 01:25:02 -0700 (PDT)
Date: Thu, 17 Sep 2026 01:25:02 -0700
In-Reply-To: <aqubuvR_2XCNav28@gremlin>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaba3de.87c06881.1db2b3.0013.GAE@google.com>
Subject: Re: [syzbot] [kvm?] BUG: sleeping function called from invalid
 context in kvm_mmu_notifier_invalidate_range_start
From: syzbot <syzbot+c3178b6b512446632bac@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, bigeasy@linutronix.de, dwmw2@infradead.org, 
	dwmw@amazon.co.uk, kvm@vger.kernel.org, liam.howlett@oracle.com, 
	liam@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev, ljs@kernel.org, lkp@intel.com, 
	llvm@lists.linux.dev, lorenzo.stoakes@oracle.com, me@brighamcampbell.com, 
	mhocko@suse.com, nogikh@google.com, oe-kbuild-all@lists.linux.dev, 
	pbonzini@redhat.com, rientjes@google.com, rppt@kernel.org, seanjc@google.com, 
	shaikhkamal2012@gmail.com, shakeel.butt@linux.dev, skhan@linuxfoundation.org, 
	surenb@google.com, syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c3178b6b512446632bac@syzkaller.appspotmail.com
Tested-by: syzbot+c3178b6b512446632bac@syzkaller.appspotmail.com

Tested on:

commit:         f902e69c sched: Allow sleeping spinlocks on PREEMPT_RT..
git tree:       git://git.infradead.org/users/dwmw2/linux.git seb-nonblock-rt-test
console output: https://syzkaller.appspot.com/x/log.txt?x=17d63bf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a263b38e64491d5
dashboard link: https://syzkaller.appspot.com/bug?extid=c3178b6b512446632bac
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
