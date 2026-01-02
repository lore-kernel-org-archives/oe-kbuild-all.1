Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61F17A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jan 2026 04:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767329946; cv=none; b=jjwvLk5eUy/G3bAWBTgjbl7W0rCvCGSrdVxX1O9tE2j61OGQYfxGWi4ehpf4YmxA5jV31DgGCyEgay5wBNJ+yxVfxuAyyhMUh/7psRDHP6LmAoOYl17aonqHHSgYo4IVH4y3TjIN0H415xC5VaVrvNzZQyDvW8Dh4l9DDcGEZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767329946; c=relaxed/simple;
	bh=MBOje/xYkrAFiRDonh/YjmAHO8oMKM+i0qoKKYV75xA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=apiIDw/U8sjzh8gmyUK9oDVeYPBdTgRyRgb7DzKV2Go+InqdfITh662uX4DgiOCO0qDgjFeVRCmmkZSF76vWbP/+kXR2tvSPbap3sMTrf/YzKArRyjRPV6vli8XuKK8/rQLQ1Y9SGAig2p3S/8X8swH0QXCEE5Pwk1NwV7taTSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-656cc4098f3so21872929eaf.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Jan 2026 20:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767329943; x=1767934743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+AmQB/qRhVQmFyRyvwyMexTVCJAt6poo+xGp2Hku+Q=;
        b=elw6hGD1tiyq9G04KhvsxsqUMLw1YNCniWAyvgCirsKyh3TwnrrCIq9piuMZDmFs9l
         aL3FjTUZOFYBFpXLQBE3nHCBq541gQOGYZgnnH66Kb+nNfxiDwK65SvKwyt7QUGEp1XD
         MFvIk5iuodwBVEm+m7heIwSfPLorTeEMnsGDy/YVrmIotBk2EU9k0r2Q/IVPSA00JRiQ
         /nq6cc/VV0MnRjW7UNt/NC4QHcb66t+wVmAzSQzE3wkheE4V+UvKYRP/0FBgxNDjd442
         0LdPCwNNjsbDBOaVZZrIfeaWbg7/O4yGzi5CqJizUu7JNh56LsJtxDzTiEeIcjWYEHm8
         lLBA==
X-Forwarded-Encrypted: i=1; AJvYcCUUmEpBM0kNMvvlXHinwxynfGf2aI1XLNA23LSQPq0EEYT6at9zKR2xOP9F5peTJ91C54WrvUWJygIcnmw7@lists.linux.dev
X-Gm-Message-State: AOJu0YxXSFChoQVjCimXGobpuCODDubvMUhF/ZwI7cSE5tNnXIPS7h2H
	17wITnVGjBPghgKaMHCP3Bt7ECltz+KUZLUxCEP/rCqCZ0idyaUZJSX10jZBiLEaJdkP4npWEZ0
	tPWoHtYwEMI4Nu9kAAF6WuIOEJnz9wKZexwhPzoSwLA6tpdjKXms7DzKHJb8=
X-Google-Smtp-Source: AGHT+IEJOgw+s7C7AFHLDe3b3IkHaaHTh3029SB8ead8YTreFqPPvVrzrv1UEJCmDyn+ROr5A06dXci3QJIZd1diC5oXY2KitSLw
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2229:b0:659:9a49:9026 with SMTP id
 006d021491bc7-65d0eb10455mr18137360eaf.83.1767329943245; Thu, 01 Jan 2026
 20:59:03 -0800 (PST)
Date: Thu, 01 Jan 2026 20:59:03 -0800
In-Reply-To: <68ed7606.a70a0220.b3ac9.001f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69575097.050a0220.a1b6.034e.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] INFO: trying to register non-static key in ntfs_setattr
From: syzbot <syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dan.carpenter@linaro.org, 
	eadavis@qq.com, kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	lkp@intel.com, ntfs3@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	oe-kbuild@lists.linux.dev, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit be99c62ac7e7af514e4b13f83c891a3cccefaa48
Author: Edward Adam Davis <eadavis@qq.com>
Date:   Tue Sep 16 05:50:13 2025 +0000

    ntfs3: init run lock for extend inode

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=113ff222580000
start commit:   98906f9d850e Merge tag 'rtc-6.18' of git://git.kernel.org/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=af9170887d81dea1
dashboard link: https://syzkaller.appspot.com/bug?extid=3e58a7dc1a8c00243999
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f4e542580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16e5e9e2580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: ntfs3: init run lock for extend inode

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
