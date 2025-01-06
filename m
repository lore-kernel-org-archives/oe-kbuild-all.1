Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954471CEADF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 19:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736191579; cv=none; b=HVcqdyYguiqoI2+9EfLx+GSdbIQjMUAODGhQMKgSWihCvgl9nXraUjezOziV9Dei0gFxqYX6zVB/MYih8lwu5/VN4UyTNtJmO0rJ7zGjcFod/k0FGH+Qac1n3wqavoJkNhBF/vzEjAD5DV4EFswJjvUjdGLWgF1wbeOqUc0H/R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736191579; c=relaxed/simple;
	bh=uPM9wfOc19ZNYHfAIXLVA4j8/XRdtqOrfZ4kHoatFCY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pzaQ3xupHH9VGQg5Hfti9qX9CK+YQLym627hISLH5vQdUjEzov5W5QSQ1GcrjAmKOYadC2H0tHuhKBPxiiVSnwb68TxkY3rcRtv1XJw8cf2UrSx2krHj8LKp7ER527BQ69STua9rf8ZhOuxPj/v+9gLYWTeQC58iyqe9q/ZHM7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=suNJN9zS; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="suNJN9zS"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2164fad3792so198335535ad.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 11:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736191576; x=1736796376; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ceL0JnomJN5T8RRT1BFiQaRsG0orGxyG1hM/z2a5GBE=;
        b=suNJN9zSYjv/PCmobiH3co1eIt/0mlXo2XbDqazXg0DUBwB8Bi/FL7/AGLPeShw6hJ
         ZB9DYdFWSnepxdcviW+Ja8qCyujVCm1mY4pF74JzN+88EXn6fDMvMfyX4j8I/4dOpSjU
         MP3orH7jrz0GTu/Kq/pV0fJfpZFZkOqVFD+6vRxndLVVuNj7/O+td85EIXv4IARJFScs
         7t97cY6gjXi5B+ZSmII1JMUMPi35wMSHFW9tmblF4DDGDYWDOYTTWHIif+1ij8u1zmob
         lYWMYbvOrLsGFu7oYPnhEdku+Cyw3tXEir4vVDWMiE4Ymh/LoUh+f7S82F/P0FNpHtJC
         QMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736191576; x=1736796376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceL0JnomJN5T8RRT1BFiQaRsG0orGxyG1hM/z2a5GBE=;
        b=W1PpcezG6k1CdoJqxqvYbkQmakchtYtMaZZHAr2wkhgNLr0CRx3tb48MSI7IEzjtAv
         0IGJDONO5VY81JZjQDJPs7rjXjlFoAns/1MAl8XiBHo9s/kQHHLbYep853Hax+VsdXYV
         z2Cw+o0hOaYJlRldExzW3vfDRYjcKLhnJaxYFeb/SCU1ggMMqgLL8UjcFktt82r4ZY4j
         d/oxReFrcwVNuzz/K/BV/wcU0+CLnxpZd2O4f/ClREQ7DK5eB3dSmPLqcgCdRUSHazul
         YvJVDZ8IzG0w7XZ4oOVp2mDriq0b/YD6seJ83pjGJus4sjZHVqDomPQzs87svk9nm5hk
         a7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWqin52nErYDZOUEqedkt/yl80qwiMwKzRL0kKiw4CNq0vlb+JrIM218DObwMwwoQ6pRf6KxWXrsI37kW9p@lists.linux.dev
X-Gm-Message-State: AOJu0YyaNLXRX6zLrYxebVnUYEcOY6DqzcbgOnj6ftFDoUxa/Slb4lD/
	0w+iC/nA8FhImpyTjLBIIN6whpIVbmTBq6hd2lGX9EdSa7vHQ3F/owZNxifV567/JGWMS6DwWNO
	u+sPWT5WEfg==
X-Google-Smtp-Source: AGHT+IHZ2Tl+7xAAtRCL+7tmkaiYdEaUGaYbtc9hkDvT3f8mT0xmwIpVoFi4FyUH6eA2ZaDqwQujtOJmxB3VtQ==
X-Received: from plbml11.prod.google.com ([2002:a17:903:34cb:b0:215:b464:341b])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:41c3:b0:216:485f:bf90 with SMTP id d9443c01a7336-219e6ebad3fmr756815185ad.27.1736191575853;
 Mon, 06 Jan 2025 11:26:15 -0800 (PST)
Date: Mon,  6 Jan 2025 19:26:07 +0000
In-Reply-To: <202501031535.erbln3A2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202501031535.erbln3A2-lkp@intel.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250106192608.1107362-1-cmllamas@google.com>
Subject: [PATCH] binder: fix kernel-doc warning of 'file' member
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
	oe-kbuild-all@lists.linux.dev, paulmck@kernel.org, uladzislau.rezki@sony.com, 
	urezki@gmail.com, Todd Kjos <tkjos@google.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

The 'struct file' member in 'binder_task_work_cb' definition was renamed
to 'file' between patch versions but its kernel-doc reference kept the
old name 'fd'. Update the naming to fix the W=1 build warning.

Cc: Todd Kjos <tkjos@google.com>
Fixes: 80cd795630d6 ("binder: fix use-after-free due to ksys_close() during fdget()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501031535.erbln3A2-lkp@intel.com/
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index ef353ca13c35..f790356750e9 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -1971,7 +1971,7 @@ static bool binder_validate_fixup(struct binder_proc *proc,
  * struct binder_task_work_cb - for deferred close
  *
  * @twork:                callback_head for task work
- * @fd:                   fd to close
+ * @file:                 file to close
  *
  * Structure to pass task work to be handled after
  * returning from binder_ioctl() via task_work_add().
-- 
2.47.1.613.gc27f4b7a9f-goog

