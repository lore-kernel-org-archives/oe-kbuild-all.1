Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BBD3C9895
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586654; cv=none; b=M2NpjVmucXhi0riXmrpg+m3V3ZZEHPnbu86JQ72XKB8npwoG18eHESYyhHGQ4V27WQMwJvG7ZxLANfVzaxRbKX2q/0FJAi7qAtkah5UhzbC0wHDivL8U+zXiAtE/Fr9UzVLHU6hdEf6fTtMYxTJ9TsfsshBLMionpvB3gSBAJts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586654; c=relaxed/simple;
	bh=T8e4qFcoWW/dNathKMvtjSc8MmQ0SvJgeeAGEMDyUMQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jMn6alnwAW3Uz+yT/DdvVusuOQQ+95cX0Sks602/WpvjmRNPfkWh6DOigc1wxM3U489qgjnSFrsbMZ2IJionN4RGU0h30TEtiaZI7wqptRSAw5b19OrztLRzlB+BmUaDqW2GC4d92OIW5pBNlAQk77m63Zs+zi5mmBlDOauXQLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c5a1a0b54eso214481b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 12:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789586646; x=1790191446;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gGav+E6NmhUVSh9XUjVdcV/Auw85chnTv3eOmsCDzNk=;
        b=ZYCJsmH4Ah4bMVLA+ZuVQolgUkC/wnRW6UHRPlwI4JKcktbmZzu8O1KhFfNFjagqhW
         mTloO48jGhQk2KSy9yjkZ6PwzK6BBGiZG2JBbPm65a+Q05oYwg/CWlBlgir8cM90Ur9w
         mY8mSGwI4k3hEyQY6MnIZIA0BxB1mL35jO2JuAbfH29EHoKzGFzcevXlLSbtnimBdNzY
         8FiG8A6YtVGKOS8Y3JqmkfCXNu47mzOQhzr9qbSAOurc73sF5k2eoQC3Pr8zasr2iaxU
         Fmw84r4FvUC5kbviys2rLMzNdiSIOazB9q7Exm7829toC5F6Q5r+tgYvifJXV1MIHQ3N
         HgLA==
X-Forwarded-Encrypted: i=1; AKwUvBwKoFTzHnsSj0OSmYTEeZVsoErh0hzQjyQMRgpfKsIPlbMJ1a5HwhFj3KeihUdtLSQHNo95rea2f19RkbRy@lists.linux.dev
X-Gm-Message-State: AFuF++kymgF8nKERAvuovGHMxAznJIDjQbHdDhnp4HD6d/izVLExHZLT
	cg8bvw++rWl85bLVZtzAHVUwQBbTblEBCXAIPJyoo6GcIi/7yPWZH3HU7e9Co5glBP6dp6hyLO2
	fA1yciCsgz/lLaQ6qYMeET7AgGT1urFWLvSv1Wcya1BU1LF3ES6xTlot/q3Q=
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a24:b0:4c3:7695:d30 with SMTP id
 5614622812f47-4ca4a1dc406mr4599160b6e.14.1789586646123; Wed, 16 Sep 2026
 12:24:06 -0700 (PDT)
Date: Wed, 16 Sep 2026 12:24:06 -0700
In-Reply-To: <aqrZMReaQPG0M9oV@gremlin>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaaecd6.4e05fbd6.392abc.0003.GAE@google.com>
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

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 7



Tested on:

commit:         9b87fdc9 Merge tag 'sched_ext-for-7.3-rc3-fixes' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=c3178b6b512446632bac
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15a16bf9580000

