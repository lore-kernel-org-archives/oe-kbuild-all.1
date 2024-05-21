Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A192B9C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716277366; cv=none; b=bI3Cf1MzlkvGHADuejyEULsgSdAIKhKNjKLpRmqpiddYPtTEYb8bmuleq5JfsmzCY0mfwtchQ9SLDH1FHfW6i96jMFS7llnjbOETgVzOatt+IYGEjrnY98Ongw5vop7h4bfiVoytQJCPXSP2MdaAyCOF+6Gz51uFIkXfLTdfG3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716277366; c=relaxed/simple;
	bh=pElaL1FAncUwF8VTpMmv5YQrqKIaELJt3TPOO8TC1UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=on1ZDvHycfZzCawQCxdSFaFwkgxEiiqciJOkXbkZxurijmIm4HSHOCCWDXY05+vFlNMA145XePzt6FbmUW1/eJkx6EXD+k5K9ah7CdEDBwtb5IrMHcuZs6dYFXH1/kg0wWGVwaPk7k+FLmmkdWtzZctY8HnJTCIwtBlCXn78bgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgByZ0GQ; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgByZ0GQ"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7e201db9f47so180327439f.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 00:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716277364; x=1716882164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzDui6gFCDrSaPkqR33yJQ6odC4dTyKQbQ9isbJMxIs=;
        b=FgByZ0GQa7PxukYHFsb8faVaMyT8obhYJjA8+cii0h4QpsJXvux+AA4mchf113Jnw9
         miqV7CNZrJ3UJgW1hYT+wu5RO28V9RVj15+Cp/FY8BcRwOHOxEEGltTLMn5ESbKN+TBU
         frh3NUKGEowDCR1PEEPycWOBnfUhgUStgJyVXZVKtRHyKXqXY2MCWJev2D1qENzXuzTl
         GYq5qgeaSoPAVkPJBGYkYwd5TdBTkvwxtcmwd8z8dpxQTziF7Ir6ALv0EtDRqVrAGiVC
         Bfu4pAb//pd2qWIRvqaS5py7b0AGzNE87LnAf6NPACrM46xPlprJUb/RyM4AnSaBqhVz
         NWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716277364; x=1716882164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzDui6gFCDrSaPkqR33yJQ6odC4dTyKQbQ9isbJMxIs=;
        b=E5bEElH+71iY0o3EfWaoSjDZJElMH25nnWd0+ohU8aD+X8f7F+xxiYJ8oweb9jOU5t
         z3+NYL3k/7G/Q0QTm0JQJhiglD3Dmx4+vQgfScXMCZW95XGXcvwaUD7nMHIa5wxLaUD2
         RYqMDi6aWHXW4Jv1yO8Fu8dJ+Igagm9YidnzlsuemKSuzJp7NrzcAtp+t7P0CwS9fClg
         LfGHcIOL2KnQrapsaRSWb/f7iu6FPa9ed5YV81+GnSuX+8/mNT3k3Jj00QzxU5L7xrEM
         26PQ0Jd6cVObBw/OzYhZn9xyMBnuhnzPQn5kGHg7aJops+XZ0kpqe/KEwm0qQCZB7JS7
         8klA==
X-Gm-Message-State: AOJu0YyqzYEoxnDnIyseOZo1pdTPu/TnZhyVTgfODhdrkmMGdkRrtMqU
	ng/tFW7aAo+UlyhNWSe2B70IGjr+tSHLBfK155LmImu6QFcMOTpv
X-Google-Smtp-Source: AGHT+IEZ5tDPJ8x7smgi8RC/0MKHejDX3a0HF7gjAJl5Zo4m/c+Q/SvwOyiKMNio5GjUCw5lTBNaaQ==
X-Received: by 2002:a6b:e011:0:b0:7e1:80b9:417c with SMTP id ca18e2360f4ac-7e1b520d47amr3381804939f.15.1716277364199;
        Tue, 21 May 2024 00:42:44 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-7e207673a0asm350184039f.11.2024.05.21.00.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 00:42:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: lkp@intel.com
Cc: oe-kbuild-all@lists.linux.dev,
	ukaszb@chromium.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 1/2] dyndbg: make __dynamic_func_call_cls_no_desc an expression
Date: Tue, 21 May 2024 01:42:41 -0600
Message-ID: <20240521074241.368628-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <202405210648.p6TPeHNf-lkp@intel.com>
References: <202405210648.p6TPeHNf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xe driver has XE_IOCTL_DBG macro which calls drm_dbg() from inside
an if (expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG
implements the call inside a do{}while(0) wrapper.

Fix it by changing __dynamic_func_call_cls_no_desc macro into an
expression, by replacing the do-while(0) with a ({ }) wrapper.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 19f959f9a6b4..121a66b0ca25 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -287,20 +287,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
 		func(&id, ##__VA_ARGS__);			\
-} while (0)
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.45.1

