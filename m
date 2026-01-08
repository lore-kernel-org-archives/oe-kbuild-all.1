Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBC13C1993
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864994; cv=none; b=FqWB4aTcaFw7uFzP0q1zURcjbj7Kra//GfNgA7LXcaQzswQMa+uRS+NEqWh2nQC8wjAnAUt4gKIFP0TseHKUKfFcIDTC/pH6i4Zj2qfaWd++v66SOGKEBpp//KA2hP86uo7occmkhwR4/i60VkUlrF32tGxpMzH+/5uxZys85gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864994; c=relaxed/simple;
	bh=t7nCIIeO3OQZrR2yAwC1/+G/qzltx4N7IsEbuaFwvBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ffk7OLar1ztM+S/NtqhGvJef0dUOhrHrS73q7N2+wtDmlTwl539iRXrrXtSvYIBfMMdugQPmCfuWjJbLccANow5g5605cOBBA4wupFtU0Yo/6iV5h1Pr29kyw+sJszQNz5S7NfFeY6x4+em1FdEBQDS88IPpfcI3YhYW4yUvJmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQnV5wv7; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQnV5wv7"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so4953625a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 Jan 2026 01:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767864988; x=1768469788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=77aRCy91/IrUtGxppG/sxPGVH1kGUTRUqja0V6/2Or4=;
        b=lQnV5wv7Keet0h4GLlLEwXb6DX0l+k5YFqcBBSROkHKonxConkrh+7wXQVt5WJ4Y5T
         BJT6cj8sABaL/3Mb7yN5Blg0rdwMOha8zpxzY2GxesklF6akNTKjPbyjsmYfLL53wnRr
         DNWSU5zvCamdxeZtbrL5pNDEcXuENc/r4inmc66HtJix6mbc8Spd1t+DE5t0rTd7UrPN
         okKDOvtPwBR2rGOEAgqN7jIosCbzsXS2+l6CiRWyDQkqnyW88SMgJj1wmCnso1Um+IFB
         Fh2AMRZLDugTFHaUOJxk+sT6D6ZsuW27EP5WfbWsAWXFSt1vMgUsoEhr84NZa7GnZ4H2
         7VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864988; x=1768469788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77aRCy91/IrUtGxppG/sxPGVH1kGUTRUqja0V6/2Or4=;
        b=MqsMnBYZNP8jUZGUwdbTLxr4gxqMBMFRJqxfG3rAK+ZwQIRksI+X5j1UQlGPlZYPre
         WCPdDjTizfqfv2cyK7b8d6kDJbQ2TullmpCtBr5MD1G4spFntodWZVmQSzRXps1XcJtj
         A6i5agIoF6/o3mvOchoJi/64snZ78vfT1f6b9Fj0rHBMiNlt/YufPxIABV9G4QwY5YWU
         cFpvKp/+P1JarNxaCUBTRy2ckd9q8/Mm2EBhPrf7/lcn8blBBFC5jc+2SU1GfOfC2Zab
         X5LOVe13BVOWjbw3xV55b+y2Mn9FtJLR1HXk8dsv0wLRlG9qOibOedVoiknNlc3a44X+
         sW7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWguOUi17JiWG4AtotfUl0MKA64Qb6mvYriVH+GHYhk0bPm4GeBbjFNPwMSIH1R+NsJkdvuEBigORKHRP6Z@lists.linux.dev
X-Gm-Message-State: AOJu0YwrMSK+tiIk34x6VQhVTTHUQBmYXJ4cdC+B495QwAz/bK4wPXeC
	FV1Zunu9DWKsvhz+fCxyZxjIVBun7HIp5EP+dqriwpM9HNXjvcgdZETu
X-Gm-Gg: AY/fxX5bz0WMaomzbNlqcVK8k3xJ18rfaGyAhQdKQaniCaYp+T5SPqhCPV92TUWcqop
	wLNQqlFdSQ4Snx1Cals7SJ4bzcHiEfiQk6mh9VicDzx0qwIlvCDcBc8CYgd0Lke4SuTDNC1olQS
	zR9z43LcxDAkF7W2U424zNSYDEdDAiVY71aWT04xC4omG+aXJbLjvcnb9cukVzPY85rwSQBVujp
	BC5ZghRf1BkMjFyPM3y6cufgcj5KGmFICkiQUcOfrpYWjgRj6IYhWr2/7U6vsRA9zOGBynBINyl
	oTels5Dx0vRSIOiTHkBTNVRWGknxhjNZq7xNy87Jp+bRjxNibDadbMRG7VrYUQh9SbxW2e1Ryj4
	/hDqNE7ToTOdQGnbQK5OsFeSZJ4/l4u29H2wtwMe9PvkPIwhiAxFbKVdop3gCScPIWDRV1OpMuU
	0QRtvldKlJsTQL+jAhNMcqBOU5zplwj4ZsbDvrJdrUbzPSsay53ywVckg5CfvZ
X-Google-Smtp-Source: AGHT+IFacxUwkkDC1CMmZwzWKpf5iUFJm4B0hcWp9jYpCMM/XizEfy1BDqZ3dgHVRx0oH12BLxiolg==
X-Received: by 2002:a17:907:7288:b0:b72:5d08:486c with SMTP id a640c23a62f3a-b844521f248mr540032166b.27.1767864987670;
        Thu, 08 Jan 2026 01:36:27 -0800 (PST)
Received: from navid-Latitude-E6430.homestation.setup ([2.190.126.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d0290sm762372066b.32.2026.01.08.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:36:27 -0800 (PST)
From: Navid-Derakhshandeh <navid.derakhshandeh1@gmail.com>
To: mporter@kernel.crashing.org
Cc: alex.bou9@gmail.com,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Navid-Derakhshandeh <navid.derakhshandeh1@gmail.com>
Subject: [PATCH v2] [PATCH V2] Driver : rio : implement discovery for all
Date: Thu,  8 Jan 2026 13:04:27 +0330
Message-ID: <20260108093427.11238-1-navid.derakhshandeh1@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing include of internal RapidIO header in rio.c so that
rio_scan_mport() and rio_restart_discovery_all() prototypes are visible
to the compiler.

This resolves implicit function declaration errors reported by the
kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Close: https://lore.kernel.org/oe-kbuild-all/202601020041.aUIaVDCt-lkp@intel.com/

Signed-off-by: Navid-Derakhshandeh <navid.derakhshandeh1@gmail.com>
---
 drivers/rapidio/rio.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rapidio/rio.h b/drivers/rapidio/rio.h
index a0e2a09ddb8e..5d36184d2c55 100644
--- a/drivers/rapidio/rio.h
+++ b/drivers/rapidio/rio.h
@@ -43,6 +43,8 @@ extern int rio_enable_rx_tx_port(struct rio_mport *port, int local, u16 destid,
 extern int rio_register_scan(int mport_id, struct rio_scan *scan_ops);
 extern void rio_attach_device(struct rio_dev *rdev);
 extern int rio_mport_scan(int mport_id);
+extern void rio_scan_mport(struct rio_mport *mport);
+extern void rio_restart_discovery_all(void);
 
 /* Structures internal to the RIO core code */
 extern const struct attribute_group *rio_dev_groups[];
-- 
2.51.0

