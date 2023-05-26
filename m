Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B82217E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 00:15:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f3b9755961so102136e87.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 25 May 2023 17:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685060151; x=1687652151;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZfhJaqPyjefpsKuZf0KN4c3vpMY0NKu2TD2PSGpqS8A=;
        b=gqGCWt6WDQ17bGEUG7Gleu5D3Bdv/HM48cSbxH9GZpRHRAv9z42DqNi2z3lgOs5V8s
         JzNTDhtgM+7sJ8qQ7bOKDPuXHjyp4PAxaNniSylg5/mlIzSLwj59tkhhRIwS0fCXJvnb
         yl352wn9G2zOFqz3xZPNOl7RdmZmlcnmXCThsXomkVWWZSM46Bgc0xujUfLL0JECX6HO
         LvGqaxP5Z9ny3ucfuaNi6taTzKqjrmiNYWi6HrYAM+/I1hWxza05Pab0GcXegasK7XF5
         l8jukyTUkB6pCF6sfHYzsaXl5n5p6uWMhXgVsKgOFC7TLqgdgo/sLrNZIs8hh/nV8rXL
         LqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685060151; x=1687652151;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfhJaqPyjefpsKuZf0KN4c3vpMY0NKu2TD2PSGpqS8A=;
        b=at4xdZXsHURTumY/4kREbA1EW3rDH/J9DldmoUZXqao1NuUUrPJKjhj4K8CWhYWr3h
         IHQrJpb5APqv5zsUcN5JWAOvQqidxJBtXMYAQ0orianfOz75b55FRlAzdMFXhmxjbV7x
         82ynsghfygKpttweOqbBtBrMDQglcMhizhFA4G6Lqw8FEJQFWeHWaFGV9YzDNmwp8fkJ
         BXkkVHtSvtkuYGtOCf9UPQWnqCS800NVn7HB0HUuSoZ931/brnxcj0qtPYVllaj6cozI
         z6vQXRzMdws1mfAX6Q4ns2il3OENUlEFDMifCRUXSfTp/Wsrs4/tZL2TY8WcqcZ78w8C
         9fUw==
X-Gm-Message-State: AC+VfDymRk97CMa5Wgloi/YjRzC6AvF07ZMTf+GlTeTbWS4PuCtsMH/9
	FQCdxRjkhkZEGiWJryVgSP8XBBlFr6J+f10CEtM=
X-Google-Smtp-Source: ACHHUZ6LE8cIz1gksl3d2AS1aneBPslU+v1yoAVpw9fY2RxinOzLCP3VC/QrWMqEn062CA8t64vEn2IASjzMjc1dPtc=
X-Received: by 2002:ac2:547c:0:b0:4eb:3fb2:c56d with SMTP id
 e28-20020ac2547c000000b004eb3fb2c56dmr6616116lfn.12.1685060150812; Thu, 25
 May 2023 17:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve French <smfrench@gmail.com>
Date: Thu, 25 May 2023 19:15:39 -0500
Message-ID: <CAH2r5msJwaietr+iS09HJx+7ZwsJrd_AHcsvgP0zS4LPmX2++Q@mail.gmail.com>
Subject: [PATCH][SMB3] missing null check in SMB2_change_notify
To: CIFS <linux-cifs@vger.kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, kbuild test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000b8172305fc8da35f"

--000000000000b8172305fc8da35f
Content-Type: text/plain; charset="UTF-8"

If plen is null when passed in, we only checked for null
in one of the two places where it could be used. Although
plen is always valid (not null) for current callers of the
SMB2_change_notify function, this change makes it more consistent.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/202305251831.3V1gbbFs-lkp@intel.com/


-- 
Thanks,

Steve

--000000000000b8172305fc8da35f
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-missing-null-check-in-SMB2_change_notify.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-missing-null-check-in-SMB2_change_notify.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_li3taksv0>
X-Attachment-Id: f_li3taksv0

RnJvbSBlYTE2Mjg1OGM1MTU5YTYwNTJiZWYzZmU1MTk4YzI0ZTBkMDBjYjZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFRodSwgMjUgTWF5IDIwMjMgMTg6NTM6MjggLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBtaXNzaW5nIG51bGwgY2hlY2sgaW4gU01CMl9jaGFuZ2Vfbm90aWZ5CgpJZiBwbGVuIGlz
IG51bGwgd2hlbiBwYXNzZWQgaW4sIHdlIG9ubHkgY2hlY2tlZCBmb3IgbnVsbAppbiBvbmUgb2Yg
dGhlIHR3byBwbGFjZXMgd2hlcmUgaXQgY291bGQgYmUgdXNlZC4gQWx0aG91Z2gKcGxlbiBpcyBh
bHdheXMgdmFsaWQgKG5vdCBudWxsKSBmb3IgY3VycmVudCBjYWxsZXJzIG9mIHRoZQpTTUIyX2No
YW5nZV9ub3RpZnkgZnVuY3Rpb24sIHRoaXMgY2hhbmdlIG1ha2VzIGl0IG1vcmUgY29uc2lzdGVu
dC4KClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KUmVwb3J0
ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGVycm9yMjdAZ21haWwuY29tPgpDbG9zZXM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDUyNTE4MzEuM1YxZ2JiRnMtbGtwQGludGVsLmNvbS8K
U2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0K
IGZzL3NtYi9jbGllbnQvc21iMnBkdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9zbWIycGR1
LmMgYi9mcy9zbWIvY2xpZW50L3NtYjJwZHUuYwppbmRleCA5ZWQ2MWI2ZjliMjEuLjcwNjNiMzk1
ZDIyZiAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9zbWIycGR1LmMKKysrIGIvZnMvc21iL2Ns
aWVudC9zbWIycGR1LmMKQEAgLTM3MjUsNyArMzcyNSw3IEBAIFNNQjJfY2hhbmdlX25vdGlmeShj
b25zdCB1bnNpZ25lZCBpbnQgeGlkLCBzdHJ1Y3QgY2lmc190Y29uICp0Y29uLAogCQlpZiAoKm91
dF9kYXRhID09IE5VTEwpIHsKIAkJCXJjID0gLUVOT01FTTsKIAkJCWdvdG8gY25vdGlmeV9leGl0
OwotCQl9IGVsc2UKKwkJfSBlbHNlIGlmIChwbGVuKQogCQkJKnBsZW4gPSBsZTMyX3RvX2NwdShz
bWJfcnNwLT5PdXRwdXRCdWZmZXJMZW5ndGgpOwogCX0KIAotLSAKMi4zNC4xCgo=
--000000000000b8172305fc8da35f--
