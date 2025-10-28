Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2255B85C4A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 02:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761619085; cv=none; b=NHST+TFt5wzwuW5ZHbSLSTaomfBmAT94Xxbzz8nIKgD1UoTLcmRWie0rex2YtfbkjWdHVhGNxC0Rc3W43e4mNMMR19sV+RSfDSkXkNwBG6tm3Tbw54tacyBcyti15M8RjR8zVnZhAW3gSHCK6lWVj+VJYtYXin5HwQgeEfyGqgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761619085; c=relaxed/simple;
	bh=+NfucJFORP/00mVrD00XoHgUbFhguqmwyUOVKEDS8dc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VS6G8OyHidndXFVgHW0+GmeQjGEzNSlbLQgMb0ZctBszFmr9yKTD3oBTYrzNfBPRoFgkK5TAaPJBSAQKKG0lm3QewJDUJT3bPM+sJGFmMkmw4HivzArqmQtC01UvGuDpASYEg+huZb3opI1iNTo41y3+m41wtGEbU1duKiakZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hbGJoCHF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hbGJoCHF"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-26983c4d708so40901135ad.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 19:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761619083; x=1762223883; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgiyVtmXhmeHrPHy6vJ+jCIaxcozejU0dTrutqnOA6s=;
        b=hbGJoCHF7OIOvVaLb8S5f3bgWdcAlnVz6DXghb5KDpcAJ4qzRmIBdGXle4rDWwKKh0
         S33skndZBKuRKV+xC61eqF5IQaZIEnMqo1ONN7M0CZR7/D/4LHXYeQzd/5R4tOhI0oQ9
         toZ4t7bVgTtrmmoKVByZBHXxFc76umg7wzsIFYPWmrbtMpuNq3o6jI50PmoxHjT7q07P
         EkG3CM1ChfKhqnXh5C66Nao2jSdTjYcI2EIbFXKVhhMa41YUz4jImHaY6L3FhXWViR3H
         EB0pNfv28ndIjM/UnHmlaKhZHkn8CqhLDqnVkj5lEcZaCQhQuG8jVx3sd+p1fv8zo5A7
         5NLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761619083; x=1762223883;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LgiyVtmXhmeHrPHy6vJ+jCIaxcozejU0dTrutqnOA6s=;
        b=uoVFFsWfXI7FdQL0eixVaC/7Us7FVnGpbb3V3141weKZ9FdBGfP6Xr5NRtMplqR4lV
         t6G8mMqlF/cXKIo72UCyUVcYP7cl/s9doUxHgVxySEmRxAk14RdficIbuz/TAR+Su0EL
         hvoz67nxR9brP957QTR1lktzURFKWtAgIXSJBJ9X3RrlMCF1ktMWBXXfJvETNqq9x3Fn
         hOPIr+f9Wy0800RobWrrcaoidA2yu9Mj8bYq4yMqLU47Q52dlCfsZRIJ5eis+EmleQcc
         G3eA2poPYcM8XlmAba00c0JkwKhn59JVyAbxYrvllVJheIuyFEZemY4YLHSHUcTz9urg
         A13w==
X-Forwarded-Encrypted: i=1; AJvYcCXw2qkTMaYvZ15rJDbwQUTEuYU+VjcC/+ekTxCnpkDNDRFlrA0NnlDshUwykr1Pv4m2apEtKQTO21Pg21wV@lists.linux.dev
X-Gm-Message-State: AOJu0YzmlbpEdh+myySlAUO3SLJA0WHqe+UYdseIDXHANKMbXDzffMM6
	SFL8BvrP1BeZKQ/4EJghb7jWtDiQAl9kSH1frUi0jhOD3kN5Vq+Kd4vsoHdEVqQf4333yWlswEC
	BcEmN+A==
X-Google-Smtp-Source: AGHT+IEzk/xGx0XyC0NesVSpClX0jev6Dk0Hu9e/ap0h2Zy3h5HU8NNT6Jgrmsc7DRydLO5XwDXkLbfrm9s=
X-Received: from pjbbh20.prod.google.com ([2002:a17:90b:494:b0:327:50fa:eff9])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:245:b0:269:603f:420a
 with SMTP id d9443c01a7336-294cb35ec37mr20510495ad.5.1761619083284; Mon, 27
 Oct 2025 19:38:03 -0700 (PDT)
Date: Tue, 28 Oct 2025 02:37:48 +0000
In-Reply-To: <aQAjgRwd8P+YZSa6@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <aQAjgRwd8P+YZSa6@rli9-mobl>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251028023801.2024155-1-kuniyu@google.com>
Subject: Re: [PATCH] selftests: harness: Support KCOV.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: lkp@intel.com
Cc: kuniyu@google.com, linux-kselftest@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: kernel test robot <lkp@intel.com>
Date: Tue, 28 Oct 2025 09:59:29 +0800
> Hi Kuniyuki,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on shuah-kselftest/next]
> [also build test WARNING on shuah-kselftest/fixes kees/for-next/seccomp l=
inus/master v6.18-rc2 next-20251024]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/=
selftests-harness-Support-KCOV/20251017-164507
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kself=
test.git next
> patch link:    https://lore.kernel.org/r/20251017084022.3721950-1-kuniyu%=
40google.com
> patch subject: [PATCH] selftests: harness: Support KCOV.
> :::::: branch date: 9 days ago
> :::::: commit date: 9 days ago
> config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2=
0251026/202510262116.jwyrgplV-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251026/202510262116.jwyrgplV-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202510262116.jwyrgplV-lkp@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
>    In file included from listmount_test.c:14:
>    ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(s=
truct __test_metadata *, struct __fixture_variant_metadata *, char *)' from=
 incompatible pointer type 'void (*)(struct __test_metadata *, struct __fix=
ture_variant_metadata *)' [-Wincompatible-pointer-types]
>      188 |                   .fn =3D &wrapper_##test_name, \
>          |                         ^
>    ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_=
IMPL'
>      157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
>          |                         ^~~~~~~~~~~
>    listmount_test.c:23:1: note: in expansion of macro 'TEST'
>       23 | TEST(listmount_forward)
>          | ^~~~

Oh sorry, I missed TEST() as af_unix didn't use it,
but I should've compiled all tests.

Will squash this diff to v2.

Thanks!

---8<---
diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/se=
lftests/kselftest_harness.h
index cba8020853b5..5b7a01722981 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -179,9 +179,12 @@
 	static void test_name(struct __test_metadata *_metadata); \
 	static void wrapper_##test_name( \
 		struct __test_metadata *_metadata, \
-		struct __fixture_variant_metadata __attribute__((unused)) *variant) \
+		struct __fixture_variant_metadata __attribute__((unused)) *variant, \
+		char *test_full_name) \
 	{ \
+		enable_kcov(_metadata); \
 		test_name(_metadata); \
+		disable_kcov(_metadata, test_full_name); \
 	} \
 	static struct __test_metadata _##test_name##_object =3D \
 		{ .name =3D #test_name, \
---8<---
