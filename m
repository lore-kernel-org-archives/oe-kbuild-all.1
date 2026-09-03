Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F392F212FAD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409910; cv=pass; b=Z56I82s4CL32mowrYNCKpAqiY5tgPUtqLxqk0BNBfi6VpPiSoekG4VW6H2uRzSqxlxpvycH7z/GLfb6Ii8QSy6lp8ajK5WG9mx/s/CmPg5+4qEyW0WlNIG6+C3myNKkwX+BHvfpHjBC7W5oUGBLw+zA4wtPuZSbMy9TgpftyvHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409910; c=relaxed/simple;
	bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+V4anAa8OnsFL+7MxvyX8BMMgdUuOporZyJxsHnMd5UbiU8iAEbunnLmqrOEGN9BktU+vkl4rMcRfNL+Z+QxGfRenZn6oGVIRHOL8+LaPmaMn/H0yfvhDERJOSPBlGaHjMjVOztCDnI911dRqfwVgzkK0tczX1sHlBRDJvPdG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmW5rjBr; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmW5rjBr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8fd3b729dso17086235ad.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Sep 2026 21:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788409908; cv=none;
        d=google.com; s=arc-20260327;
        b=cKaH755zBJ7IG+KRtGiqwfR/bbd7iEJT19EILiiCfIP8zp2HhogKVpehglVxjEheDY
         W1qeNWARr8pnyQdvaG0ZHhKFDJ8IrzG3Xdb0Wu1zgUMGegNgH7n5/psnymQxakUqG9D9
         5ElU0S9BQhD9Ubg6i26Ry3wJ4/nzf9K0RaKZ2XGuj8XXMXXC3bMJnrRutHIN/7nEfVOf
         OwAYLQcF/CsLhkJyE9wQAhWFe5SB41A/kKr3NuVpc9xPGlOZOECV81vWvGCzvSBRPeyz
         ASBeyeOu4e37gRBh9qb3CgXJv73OcnQ0m76W0waEsAGLT8W21IWWDnE5iX71ZHL3D4EM
         3OLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        fh=2k/9fxu4o4LsFD5uZIr3cTi1jqJxPPGFDRTP8XYjuZE=;
        b=FUesz7BxBFglALg4BDDTDB0XxA9TK6lSIoOX+O4ImP7eo0HbJM6pTLdbg0mrCQGH4O
         wwARu+wNWTL6I9Hi9NlDkPAwLecDd7HbX0NyScK7YmI51TWoOEJgiZsvRDUVdBHTsSnk
         csfXBY17rDPkmxL0u4FX3ohTiMJaZMJ912QeLRP65nK38PPrXq2W74lXQZ0QBZA7wver
         RNy2p/cK3PXpHEvBw4BFazEHI/mLdt+i2vVkPtj7dEFh5+NUGrKQXEVtlCCrfiLuPJ7N
         Nfu+/vOWMCiopUqBbhtlZ6hvd2PvtcccN5IeeImkQnIjZ42rjVH38FlpvFRCmfBmL7QH
         r7mA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788409908; x=1789014708; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        b=QmW5rjBrFmgFiEDMtQ5dVQ8zYWbrgxL4EMcsYyS/Xp6hlHXJlpOxLi0aShMDt4tDrq
         5AbcLL3zJSs4g3hcp8JWc5lDbc4EvHMeDMJychr6s16MuqeM/52xGcxZkrXPwMGdBES0
         8ly/f0s8SgXdmKYGrJUwbE7+knjkLn5og2ZeJqc442fUWxxuVPiOROa3jmQ/WL5iFIHk
         FdLicS6wswgnoD7lFIuTbIQ5Xz9dJhKhSnMMrC8wMYRhYjMmiaZpjZxnr6UWzLbKrG8i
         1mjx+axFXYsySP2xF39WlppwXwVC6o/eDDoIM+T21fXkt+N0lZpxDgGnqQ8br9dfoHAt
         JpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788409908; x=1789014708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        b=VmpxFQw6JPIJa/u6UNrt6DMJnMqvZK5a3UwHgGetPy0lZDSOBsKSvE7oPDQNmKVuy7
         npLDKWwTpAa+lRNvxJQSd7oyQbXf90imSscHUIaRQ+yT0WPRbzgj7gqa91e06mL3JUWG
         5jscUxhLAs51w5y54fy+lQQwu8uSm7/G9c9w2NrKc9kfU77t/pJJFoInRnTQN40Hi8gL
         uT6ztD3AiskIFePK0JQvhMD2ePXJSRC9XIDDD/Mtmau4tI7FauevF5qABciGNOTAfinM
         P04hJN/v3ZUKh7nBPywviiRUbiKJrCrgpyEnF0znxj6KF3vvWPrkzhn3DDa0FSE3DB+6
         erDw==
X-Gm-Message-State: AFuF++kKEHmqXNbMJppoEhzG6Je3vOEL+31MyEcmPtyDi9kbDgF2LJQB
	iACxi1k03InuBmYiAdKpvBaWPvvl2IjBEEcCQ509oMm836RddQJ7ptmHpx3QR7r8jXqyv/3S9PC
	+aE7/u/vNOcXVJuAZH+0G4rBJljkyr58=
X-Gm-Gg: AYBFou3ybWEhPjTxmzjlO2ikrOe3t/IY2EPyqJxOWrVfr1sFGdmqfADwQn2WrhYl2OP
	o2yk1THUOG7VJVbq3QciOgUwrwsVEYo39e3n9JOAeYQitiFjCDEwjdJW5v8xxa2q5sbTri8k/s6
	Vdc5VE2JiYQ5JwY4T+2vGxN7usdPRBnhKbKoYkB1RRJ6WlpSI4I/ygjW3+MBuVqBA5t3dmPMtBj
	KlXBWXngC1A6txrnzJvKy1nNR6cU/hT4bmTYdHTJAaBLYOkI+8Li8XxIyK5mrbBJQW1OJBZfx3b
	5WBRKRzGE9Dt8YeSPYF2abg65uO/32r3/RaCSITSl09I6puKwIZFJV6BdMjAuQSHPMaY6DJYt1h
	FwO4hkIzDD96XL8MNFnjkb+K9RAzcQFXo6OojmBtdgH5tt+P5ARpesn0JHOTJ6Hlo5To=
X-Received: by 2002:a17:902:d4cf:b0:2d8:d4d3:da51 with SMTP id
 d9443c01a7336-2daec7b84a3mr112445875ad.21.1788409908115; Wed, 02 Sep 2026
 21:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609031134.VMzbwyVl-lkp@intel.com>
In-Reply-To: <202609031134.VMzbwyVl-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 3 Sep 2026 11:31:37 +0700
X-Gm-Features: AcwNN1UAGNeHZ0Ro131jH_gR3Av0iLt72gQZ7Ksi_o1wD_3WkkTyfR6Bijy5O5w
Message-ID: <CAABR9nH=-8AY6kgZKNNK9tWb4K8Ya7tUFn_9vYxm+AsaPw=O6g@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 5/8] drivers/gpio/gpio-altera.c:224:7: error:
 use of undeclared identifier 'irq'; did you mean 'girq'?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I have sent a fix for this issue:

https://lore.kernel.org/all/20260903030700.132068-1-phucduc.bui@gmail.com/

The patch is based on brgl/gpio/for-next.

Best regards,
Phuc
