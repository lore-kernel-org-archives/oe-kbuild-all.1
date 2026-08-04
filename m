Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE0533FE33
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 20:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874778; cv=none; b=SHwmh++PqkDYQJrX298Ub61ScVQ61sfR11qRd+HZellQQGUIDJg9Qg8QAvmv1uQ85tkDmAXctxVKloeINpi0+eeXE154w3lWdaIoDHMvoo5Re6SCHoxqzXsfjmSKySu+7ty7Zb5ocSRt7+n5JYYddL4+sUEbBiH7ggENTHOotdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874778; c=relaxed/simple;
	bh=hBR0k3B+Ox56qcPWJ0TM79yte8w4B4AOdAQPCwDKKzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rE4gF7Kikpr4K5rJC9XTZ0Ru7yWZPyz9b+CNz3VQtZEZqnZtGnuIUFDTjvdBWew5Eb1BqUvMlb3rHjTtB1vcVljbMqLx8lyZPDcBYgx+omdJxmTdrraQY49pt6MR65K4+/i4pKLH2x9INi1MMteCXDatvMoI+Oen4WeHdX6dabA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH6+2IIq; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH6+2IIq"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca7c1176317so160474a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Aug 2026 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785874777; x=1786479577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBR0k3B+Ox56qcPWJ0TM79yte8w4B4AOdAQPCwDKKzE=;
        b=NH6+2IIq/Yp7372u1vr1wv3cWIueWkP4wJ8j4hw6WDZHWPCZ+dZREFynSBdTKS8lN3
         zRkIlp7SjogXjrwPYNfcunbaAy2/E+kk+JS633a20Ot9tijr28TL5m5AFIbstP9iEUSW
         WVazZ2GOkSO79KoembHNDLzRmw+m6jyZAgRoddWxWpxYcvN0qJdw4VRGJ1TxPvbgvKk0
         5lKTs6idiZgyatVySP2ByxSnBeL/+ySva/EY8+V0DXPmVp1eGvItvItEmwlr9EXnUMmY
         PxBLWrSQxX7SiAUvwM+eNFZ3zLDrywW/dnj+W+rvEc5HyM2D/KgqaLochoDTSVejAUvf
         /isA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785874777; x=1786479577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hBR0k3B+Ox56qcPWJ0TM79yte8w4B4AOdAQPCwDKKzE=;
        b=FCmItV4FKo0UDfCNqANJYNIDHYvERwfMcqjtSQGMlPtymPzx6e/dQBooEUtZstdGJF
         cxlr+zA/HRU6h1nVrr6HHPOEaaSe5s5y0Q53fwGNp4EnRc3aA77KuYRbdnJ1zzpfQaj6
         gkpOcfLkcc9sDVB5uPKx7+wHchQBHG4sOmTzqmoDKdz2KjlumSSt6PJzIJxZKe756ci4
         3QfeZxUqr9Wx2c7E5EyrXR052gEASjNY7+8lJcjqEhWTgJ0lfm8yFYht1opnX7bDIoNQ
         +vrZ2TmlcFVkATpuutpSuiulLRKO5djTZ6GVRdowJYoL4JnGv4hgyNR6+joFoAityePa
         XuHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqryrPedKXWsoAAMQi7aX6Z0xu6OCf+/5l3t/1MhTNXdSbYT2Ggw6j2iz2Fb2JCMbaUl+RruzK2gcUcanva@lists.linux.dev
X-Gm-Message-State: AOJu0YysSzCOtsxvH6cK7CrRhVJyuNMPZp/bArWZmqgbZzD6DvyGEdYk
	5prHp/+afWTgzfJFlhx7vRIlh3y0AIwO/xzB7wucl/MKr/a9mIVHKQtM
X-Gm-Gg: AR+sD10L1YXEDqqZcZ3wtXHz5qGkJY9aawUO7usLonp6/V8cqb5cQbs92hDdY2gQ3cW
	sYfbZn/4hen9+UsHDDHi5aimIzDqV49pXs2dyzOEHAdxtK2JFOl2FCIwARArkvtNff2IrdmP0F8
	XoQfSU0nBcA92qLk2PKEeLPWcQmRLzVyInCk4WkdfcHkr6qhpcKEqsDso9PeAXeOPRZIZjrwtlo
	oveuUUmpu6MumoRbMlt662XgSxUwphTg+/R9DaGHYVHfqun86bmjpjnjtIAJ4E7yGQIw4yjkndF
	T0wLKztLlQwwe0LR+Ma6u8vkeXFtJ+c1xRj1LuAv6Qd3R75I6WMCt6M95TM5jWqTZ2ZEpHbWmvE
	nn1qA8EJ/4F7SAtSYM4Wr7//B/mPFZT1Ha9x6iMgcF+OuhASy+lg7Ck/SfgbC7ykRov8tKm5j3U
	jJ9ddX1JZGA5R3cJGNIHS+e2vajivodN1Q3r4w7dDXIjNQLBxyp2Zfe1ikVL8+qtTj8B7O+le0d
	VBZp0wICERU
X-Received: by 2002:a05:6a20:d529:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3cb85f4a5b8mr1402930637.33.1785874776947;
        Tue, 04 Aug 2026 13:19:36 -0700 (PDT)
Received: from localhost.localdomain ([103.179.230.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm12466072eec.1.2026.08.04.13.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:19:36 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: ryder.lee@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	oe-kbuild-all@lists.linux.dev,
	robh@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
Date: Tue,  4 Aug 2026 20:18:37 +0000
Message-ID: <20260804201837.2427-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <202608050123.GZC7hug7-lkp@intel.com>
References: <202608050123.GZC7hug7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for the report. This build error was caused by an invalid function call in v1 and has been fixed in v3:
https://lore.kernel.org/all/20260728122810.3475-1-sreekuttan2156239@gmail.com/

Thanks,
Sreeraj
