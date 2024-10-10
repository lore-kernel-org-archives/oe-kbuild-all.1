Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650431DFDB0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 18:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728585600; cv=none; b=AaEzzU0l+vgQFKVCeP2xgTQy3GiIkLC8d7WJHsuyo1TxfdY9qVOChIfKO4fdcZaT2AIKDb2QUIDtgu5xDVT1QF5s2WIQFydX3EPbUNvkpiGbT1p5RZKNNdwsC/76CB33+KpsmgemQr2hs4FVjVXhvoXobzRI0tyTIrterAm08oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728585600; c=relaxed/simple;
	bh=vt0d7PTWUJpwYF67FaqTOwRZSMHKQVroP6ADdcxk0tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rm7miGOYM259oJpcyJf3cSsd12uyq7e7h2XIK+B+pc0o70fAY1bVXMC93B5LHDPynNVJU9QlM9EZf8ceovxe5/gUfPLJWkmfJvnwQIgPptXYnv7Fa4wzXtcURNXUaRLakjSNSDx7fUiQ56WSPKLT6CyNspdduGX8MrNuOhtROyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFiK4z2Z; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFiK4z2Z"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso935164a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 11:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728585599; x=1729190399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vt0d7PTWUJpwYF67FaqTOwRZSMHKQVroP6ADdcxk0tk=;
        b=VFiK4z2Z+eixoXT7AV6nPFbL9ebuoabrWLqLsFDsPdBF/a+oXfgzxAbLhYwZGHqc2h
         sQnV/yCvpj6jqX5QoXCu3ZCLMAQxlYmS7Vw1MP0msy+ZzfLmYhTSHSrXUkBW5pgO3Pbl
         iN26AeM4ALplkEnbjlbmUjLzCGyI3oZsKX6nfo0eF8niMZwdXivwabawhXUAI2gEpaKs
         DTso6AbEgjJgXDCUVA/0h9NJMqiwQrg1q7TORcOXlD28W89ckK2dtR8LudI6wRhXtLMe
         6IrWx6hQyp9mLzOx5P+32BPzJmvabg6xGudp1TCOD/JbouW6v7xP7tDybEuB4XcAQCIt
         cZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728585599; x=1729190399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vt0d7PTWUJpwYF67FaqTOwRZSMHKQVroP6ADdcxk0tk=;
        b=fsiO78J/Pc26g5Qo5WT4u8PaRtr7fxXj28R1b9KzOeq+gseUm8sco+P4utYSQzJwy2
         QsKqzfYbzEFUD6I4q+zhYLxW1yE9u8NEX/aOzGO1FRoY+hM9mJDkqSp9dulPPKvflBnF
         QWDOmz/RIvTdbIf0ATMeFmBwg/ZNHRQJa4Kwa6+ftwDwD5W3CfuvA7CRhBzOvXpVWvhF
         YroBg1RLg8lOlFLzB/qP5qTOxm2V1xwP70kqML0ySy10IwCjwNepbtGJZg8b2KTniihg
         MXzTsiCJh8WwleL7HqRn86sK+4/uN2Q1fUqNqgvkjrEl/2PQJFeNYFCco/9sq+BZ7WNp
         9btQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYhaADoMaXoGgNmU+DP+a3W9GsWFWrqDCcjuW2aKRg4BkU0nyS8BcPMhEFyqqiKUF5ocqo9b5+StirOIl8@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0rlQnhwwjkFRt6XZL8maDYZ0cktRy2y0z9Ssn864jNKGq9T/W
	742p7ibD89MbV0LavehMauW0uaVue1oe/wTeDZ120s7w16ivKWpP
X-Google-Smtp-Source: AGHT+IH68yKbuVbBykHvA5QRrX99U7UIh7JlELPRwWGopc9OZpqMcdOZLjwzgB7xwIE7KEFGDm9iIg==
X-Received: by 2002:a17:90a:d90f:b0:2e0:b5c8:9ca2 with SMTP id 98e67ed59e1d1-2e2f0a971bamr148279a91.9.1728585598626;
        Thu, 10 Oct 2024 11:39:58 -0700 (PDT)
Received: from localhost.localdomain (host95.181-12-202.telecom.net.ar. [181.12.202.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2e6ef1ad0sm681846a91.49.2024.10.10.11.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:39:58 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	kuurtb@gmail.com,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] alienware-wmi: Dell AWCC platform_profile support
Date: Thu, 10 Oct 2024 15:39:53 -0300
Message-ID: <20241010183953.13231-1-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <b4746132-2282-3cb4-64f5-bc83afbcafae@linux.intel.com>
References: <b4746132-2282-3cb4-64f5-bc83afbcafae@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you! I noticed the kernel thanks to the kernel robot too. I will
be sure to add them in v4.

Kurt

