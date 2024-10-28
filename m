Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4618A959
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 05:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730093505; cv=none; b=j7e3yVtdkelznfMFyLXH4VWgLHvNTKbP3ZOJCQO11eA4OGL8tF8O3LmmDW+LO2NqLPJvuT72nu9k/JpNXPQ2fDRMh0goan1jWDKhu5o0ZFcFxHTc6OKa5xAf3O33KYmJGoGoFxj5r5oyYUY04v8jAhhzFxyYykAHJQD9FlruM8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730093505; c=relaxed/simple;
	bh=aNPNOoKVsPojEBhxia3xk3JbPFV30hk8lKIJ574hCTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8rH6m2tqIXscgGJVPBrqw32QE9raXhxCraJexROyKIoMdF8OMxZ2OpC+rbuQP68jRvEH8fR0frh39Di9JTj7Ms4Erget9X/7eWf3W8vWGkPuWy2CcUADLXsH6PKJO+3L4rj/+tgRCFd+z28o/ThH6qOkJpukSLtBkpcYAALYxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvupWBvi; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvupWBvi"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e49ef3b2bso2771516b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 22:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730093503; x=1730698303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEQg2GoMuqIfSvIoQPeUZTxQLBpPTmz3yv4aNSrSx8I=;
        b=QvupWBviFXMt+29WhHBlaxc4zJ0divoUOWjzb8TkrGtV05w+ixgRU4ymQsbjEVECpS
         viwlo8I92O9+jWDjF1jNRL7IbEXadCUpnmjdYhvHF7DU36B0NsQexcPRQdrXnjiCS/dk
         9T9n98V2qLCjRHbgeT1SZzwAsqnB5bBEPdoKQRczELAjJHcduYnVhTPl6Zo20M80YbRc
         FdB2twvz6qIKqoSOZU2LtoSYOzWyZpPQlzlC53fBi7q2HTfM4yXkqkmztH5RFA7+BQJh
         6YQ+y9fB0ldcCyGtEU9+GIjyXoefDtom+ZYHUr4U1w71k6MqIBLrCOi2TBG8fCabK1Kq
         +aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730093503; x=1730698303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEQg2GoMuqIfSvIoQPeUZTxQLBpPTmz3yv4aNSrSx8I=;
        b=neUMU2NeeieWs51//xfo04QkYv1pACEXhIpmNrWsVu6B7j4ZUYuK1J6yDyRBugAyk4
         zzNaEOwTLIRYKF8CZGsOxHVcw4dwTdXCDoLJ96Xb0QSz+tCkWFbaTH2ZRVroJkXd27Ta
         H6GjgGA5mrc2piYe09I2V+w5jXkaN8tlMKrKWFjhkZH/N52YMSYrY+ymhva9aZM4QzvS
         ZZrXL3Md3dnFlfD2GMjYnc0fGAvB5t/YyDii4k+/DBPi33fBsLTGuMIh9IsbzvwaKPgW
         wECdqgheI4GaXh3hNugukemuo+KMHEDrtUPHlVyeJSlxCli2D+0qmfB2K99HB+Td1e+h
         WMdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8YwEeBh9PPlF2BpCynkP/VSUPqpTJqGN0KV34pKjCqr3u5S0ZNrRJSZCujDqEVRYCI6f2Ie0Tq8L0Ul5V@lists.linux.dev
X-Gm-Message-State: AOJu0Yz257UxmqJv1TApKKuDUgdlizu+2gYU38VG7Q0tzhd5aOFe7YEL
	AQf9nVnbzsu4CejHHPaqzH4qEYlHGTCd7o5GIcTnGPZhUF9CPsHM
X-Google-Smtp-Source: AGHT+IGSIgLqaS9EfKl+irLis0mB+1g7+V3NTmH7i2LhfvWOB0rPfTqN7PSmEu+Fb2udknSnwC64ww==
X-Received: by 2002:a05:6a20:d806:b0:1d9:6f7f:7ad7 with SMTP id adf61e73a8af0-1d9a855f791mr8603381637.48.1730093502558;
        Sun, 27 Oct 2024 22:31:42 -0700 (PDT)
Received: from localhost.localdomain ([123.51.159.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e5769b9sm8157413a91.44.2024.10.27.22.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 22:31:42 -0700 (PDT)
From: Tony Chung <tony467913@gmail.com>
To: lkp@intel.com
Cc: gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	tony467913@gmail.com
Subject: Re: [PATCH] usb: serial: mos7840: Fix coding style warnings 
Date: Mon, 28 Oct 2024 13:27:33 +0800
Message-ID: <20241028052732.4320-2-tony467913@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202410251501.9hTgSYCH-lkp@intel.com>
References: <202410251501.9hTgSYCH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've sent the PATCH v2 which has fixed this build error. 
please check from the link below. Thanks.

https://lore.kernel.org/lkml/20241025061711.198933-1-tony467913@gmail.com/
