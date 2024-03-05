Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AC01272CC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709670065; cv=none; b=hdJzA495eoR23ZxNoI7GA5QFC+5RghwLIABRKxaiTOvld0FdGBs4Ndbv4feUFDBnYmUWlheI7Va79wKdS4oMMrjzfWUxoN7oeoeTisALT6fpuK7n7Wp56/B0eBT4trTp7ir6XgyVF2dHmOTulDT23LcmAGYNICMQ2xFNgZG10ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709670065; c=relaxed/simple;
	bh=6/AYUfzDqzkrxKkZjplJh9OD3V2IdKBUYScD8zp5YJg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V/iCzzHiUmzFlRlSHViWJOY73J0RnOheFfQ2yzHzbO4lXGyK23OJeTNJNHUfWb4cNCp9jvMqdeB2TpUGt3z3Pbpa7IpsenqGKD1ZtQ2o/BHA4arkPidbxmTJVNRjEOrEZChWa42j0Erz/sbeChwUwr0OcPj91pzaY6QiDq/s0/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-365bde344ebso69511205ab.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Mar 2024 12:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709670062; x=1710274862;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUtUYHZsCEOa7X6Z+H+o0TaVUl7jsvxTuXTfFKtx4Og=;
        b=CBBLz+SCGIaDgCa/PL4pSSWL3rwZNdNh7bCF4PTYbjNTE4XAENNVpsDU2Ol+LDBYuX
         jZ4hUKb1+dRg75rN8MoOGvXRUbHMvK+5oqcCRcZA+MKOERuLe4TSPcvq2oBawBAWYQhC
         4nqxDq7KoJOLB1ZioVA9Jze91ThshfEJuxqMwSqs77pTxqnC82Hpmfe3DzMPBTqAyL/e
         v9wSvdAg1CxeoWH7zaUYFz2Vq/FzqxnqWIGSmbWQDxtOcfiqBfGJUTYcRcmPjmmUoW8F
         LIj+C6RrpuLYT54sGEImhrEnuL31L3OB1/aToueFIDRku7nV1YrVhxaEXkphm7ToFIEu
         37HA==
X-Forwarded-Encrypted: i=1; AJvYcCUd1mXa9h+CCF/LQLA/zA6DRu2T3n3qlvM1RKCLNOT1OHmi361pAV2cNOg2frhrdWNKOdCg6yZvktB3VatB1kAIlXFEd3KIjrRxHCTu7g==
X-Gm-Message-State: AOJu0YxjEZh+vdGethZnPmBoFyuDCyxN58E4/0P1BAYG6omafrvmoB1w
	MLC5564zPUDyTKnfSV7HiDJ9T4CauIHIu4vTIycizeReJCfSAkY/fSADN0knuH9LncbXuYhevHc
	AiT1d/QA8xYSD9a65AmIboaVt6r5/OlapdOQ6qD9OBiFbwh8QH6nkwaw=
X-Google-Smtp-Source: AGHT+IG0HrTjf9tSzpW5mhEYahI6I+CdKvynp0WSCF6pQbzs6aTIrDo95uQZixM6D1ufLCf+gnTifAlBvx8apq0D07TCgFJ6wpLj
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:6f0b:0:b0:365:fe09:6450 with SMTP id
 k11-20020a926f0b000000b00365fe096450mr104480ilc.4.1709670062725; Tue, 05 Mar
 2024 12:21:02 -0800 (PST)
Date: Tue, 05 Mar 2024 12:21:02 -0800
In-Reply-To: <0000000000000424f205fcf9a132@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c5b2ae0612ef94a9@google.com>
Subject: Re: [syzbot] [ntfs3?] UBSAN: shift-out-of-bounds in ntfs_iget
From: syzbot <syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anton@tuxera.com, 
	axboe@kernel.dk, brauner@kernel.org, ghandatmanas@gmail.com, 
	gregkh@linuxfoundation.org, jack@suse.cz, linkinjeon@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, 
	lkp@intel.com, llvm@lists.linux.dev, ntfs3@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12be09f2180000
start commit:   afead42fdfca Merge tag 'perf-tools-fixes-for-v6.4-2-2023-0..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=162cf2103e4a7453
dashboard link: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12da9bbd280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=174e8115280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
