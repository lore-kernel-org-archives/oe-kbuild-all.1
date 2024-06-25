Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002BB157A6C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719320260; cv=none; b=iCjLsY2w+9bVBIH5vcVVBIKyUTOW0Ia2lDOfZwSbPMORVfM/okJRy15tYfn7XyLb36VzFGUugfpdUJ4yDx3jHeQY8Og34WS4gaH/+vAkU3Q+tXa+bTca1QUshSswvK66K+rMu4QVOmhEGokp9sb/4OPAmogglg1qFFxiGN/Rwrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719320260; c=relaxed/simple;
	bh=hiX/lFJH99BwTvtd/XYXPUirYQo3psj+Vpl2nH/geAg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZJyG77bCEzi8a5pTnen2+2rA7dmksFNbD+AcXegQ0pFRsJNzuc+l1VvGqOTN6T0Lh9auo9hC1mlyBF+QictsChxAxOYvHxQRxsIlT8c/sbHWGbBqkrBJ19NoI3mr3S904l9xJ8H98X6zC1T3QNSTIP3HjVZpKo0eMVYYCgo/58M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L234kOMP; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L234kOMP"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cdf9f934fso2990150e87.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719320257; x=1719925057; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2rEKkD7V2tH6Ok9lwRlb6M97RUxTNvraYNPbf5dbADE=;
        b=L234kOMPqrueu7hZ8BgZOlKZwDrjtbWSkkhwoSibDVzZRImFcqR7DyY6X+qVv0xGR0
         y9vpJr1egld8WVX6xZBRkRDNOmvfhFT9tKCj+zQ7HgaqPI6jaaz/4GKRPdzYy2WNhjPy
         k58Ttv6fNFzPoNKUBCQ+Ie4A5w13SQJ+QD4NDSXjLbafhPBNMyf6Sen9Blnn4JSm8ABS
         Kf0R2tz9A1zymSiuPm0AUd/Ka02Ooco9LkqCsd3ozZwMl6SPqjMFMVXT+ptGcwTpMjAQ
         yIgFIpmTiErgop7n6CFPJ9P70ySccABNH3BakR005a7iRZGiTvs5MyLc7Qxj6U/zCEwm
         bHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719320257; x=1719925057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rEKkD7V2tH6Ok9lwRlb6M97RUxTNvraYNPbf5dbADE=;
        b=N40TcsI0mUzodXorFSQmwynVRSGjRLstOawXCfldxfnTKz4Z75brmELB8zRyvyGQdJ
         MVSdbm64UKhEr9eWptW4VNLdFaYIoI7LXx2ApfgNUE+N/D3dyIxwiywsYQRh1m9g85Ra
         7i3ymqxhTWnGfnYj4OA55RbqaN5zG54ECtN2yhCB26fk9ngFWocbkrdsl7y6JkUgsEwF
         jKrnc4IFzVOq08+Ni/crW8Yous2u4jnjOGvSl3OXedpZ9omwleEL2OcyWL0lJMHPZMI/
         oR0/YEw2oJlc9lJaVIV4uCcmU9cpNDFnDSxphjB0iFQyE5bCzaSOuww6PazFlplhNw8N
         v8qw==
X-Forwarded-Encrypted: i=1; AJvYcCVke/vJtSBHLvdPsCOj/JggHpPk9L4vrzaNo1wlaB9Suw5CMJkyp4pQBbhNmx8bRZZ8shV7Sgl15LCJaQVJAFi2KevQaGY856wB/millA==
X-Gm-Message-State: AOJu0YydTWikUtGnuxhcXSxfLzZptzbMH/EEL+Up85TErlOFrFDplC2c
	rrcqDWS0rhk4A2b/zu5Bdyk8Yp++Fc7ngCtO4mreJka+uN5GkMCF
X-Google-Smtp-Source: AGHT+IHr65fV8bE4i4m/jYWnI2hJuHAcFS/zLp0flAAUIY1B7gsR/pRJn3GX+QupEnLMcGlwprX1NA==
X-Received: by 2002:a05:6512:281e:b0:52c:e450:773b with SMTP id 2adb3069b0e04-52ce450785fmr4967644e87.61.1719320256787;
        Tue, 25 Jun 2024 05:57:36 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f675esm12907761f8f.22.2024.06.25.05.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:57:36 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Cc: Teddy Engel <engel.teddy@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] staging: rtl8192e: Fix conflicting types error with net_device.
Date: Tue, 25 Jun 2024 13:56:38 +0100
Message-Id: <20240625125638.28041-1-engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a pre-declaration of struct net_device so the compiler is able to
use rtl_pci.h / rtl_cam.h.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406250858.L8rJMHQm-lkp@intel.com/
---
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h | 2 ++
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
index 3a5635494385..9deffdf96072 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
@@ -12,6 +12,8 @@
 
 #include <linux/types.h>
 
+struct net_device;
+
 void rtl92e_cam_reset(struct net_device *dev);
 void rtl92e_enable_hw_security_config(struct net_device *dev);
 void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
index c645775b2150..3e39c4835ac8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
@@ -13,6 +13,8 @@
 #include <linux/types.h>
 #include <linux/pci.h>
 
+struct net_device;
+
 bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev);
 
 #endif
-- 
2.39.2

