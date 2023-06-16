Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428241100
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 06:19:54 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b52bf6e669so3085615ad.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 23:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686896394; x=1689488394;
        h=content-transfer-encoding:fcc:content-language:user-agent
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/pa9zy1PtKHGNvngP6qHVNDaGkPbLnoGxIcEw3KeKA=;
        b=Qor6pzkoc40wsyw3THdJ/BmPM0nOzu8dH4EfMcBXhTj+dYS8XDisq5rBaoeoo9QSFm
         +mpBjkOEfEy5TYFZHrnOC9zUcD7HBEuIcq1agIBtvuODemQJTflkoO7P6Ie3PhT+/7Au
         ICM9sKtgUH2ojXOSjVuvolsq6CTccGMQCIOpBzZ3yUP2Vxy35U4LjZ+BgAR0s7UU7rcp
         X0rNUTyxJ1xUQ8CKDFAe3QjvPVwsWbJyFdbuEvlyKOJM32MOepP+C7tUvKZwMD7kSC8l
         7UHzOPD9G9bCjMAn8/oyUYsoX7wnPYYM21bkcY5mIrYD8L3Q40Uoi/tI518pNGkN29P1
         cnug==
X-Gm-Message-State: AC+VfDwK46lOfmdP+X7U5BerseD9GjRTq6mLtdCGmss4T0fwQmhsQQaM
	kEV403jSsyBJNETtEEtzWaU=
X-Google-Smtp-Source: ACHHUZ6wr9ey9/YwC8SQsIxnhTKv+OU8p5VbqgUn+kt7WC8pvZ5LGXWOmxB5kAy5cZs1l4GQ2Voh9A==
X-Received: by 2002:a17:902:ead2:b0:1b0:5304:5b48 with SMTP id p18-20020a170902ead200b001b053045b48mr1089927pld.0.1686896394472;
        Thu, 15 Jun 2023 23:19:54 -0700 (PDT)
Received: from localhost ([2408:8453:744:15bc:1d2e:7d4e:2024:8394])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709027fcd00b001b3df3ae3f8sm349306plb.281.2023.06.15.23.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 23:19:54 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: linux@armlinux.org.uk,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	corbet@lwn.net
Cc: rdunlap@infradead.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xy521521@gmail.com,
	oe-kbuild-all@lists.linux.dev,
	lkp@intel.com,
	bagasdotme@gmail.com,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: Re: [RESEND PATCH v4 -next] tty: serial: add panic serial helper
Date: Fri, 16 Jun 2023 14:19:50 +0800
Message-Id: <32e022c7-f041-3bf2-2f68-3ed2119c951d@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023061606-hunk-overdraft-8d04@gregkh>
References: <20230614025512.27746-1-xiehongyu1@kylinos.cn> <2023061502-submerge-preachy-4413@gregkh> <fbfbbad5-2418-5c1a-87f1-dc2ca20204aa@kylinos.cn> <2023061606-hunk-overdraft-8d04@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Thunderbird/102.11.0
Content-Language: en-US
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0; attachmentreminder=0; deliveryformat=1
X-Identity-Key: id1
Fcc: imap://xiehongyu1%40kylinos.cn@imap.kylinos.cn/Sent
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2023/6/16 14:03, Greg KH =E5=86=99=E9=81=93:=0D
> On Fri, Jun 16, 2023 at 10:31:15AM +0800, Hongyu Xie wrote:=0D
>> =E5=9C=A8 2023/6/15 18:17, Greg KH =E5=86=99=E9=81=93:=0D
>>> On Wed, Jun 14, 2023 at 10:55:12AM +0800, Hongyu Xie wrote:=0D
>>>> It was inspired by kgdboc.=0D
>>>>=0D
>>>> This is a debug module that allows you to get all kernel logs=0D
>>>> after panic.=0D
>>>>=0D
>>>> Normally you need to attach a USB-to-UART tool or enable kdump=0D
>>>> before panic happens to get log from kernel after panic. If you=0D
>>>> didn't do that and kdump is not working, you can't get any log to=0D
>>>> know what happened before panic. If you have a USB-to-UART tool=0D
>>>> and the UART port on your computer is working. This module helps=0D
>>>> you to get all kernel log after panic() is called.=0D
>>>>=0D
>>>> To use this, see Documentation/dev-tools/panic_serial_helper.rst.=0D
>>>>=0D
>>>> Tested on an arm64 device.=0D
>>>>=0D
>>>> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>=0D
>>>> ---=0D
>>>=0D
>>> Why  is this a RESEND?  What's wrong with the previous version?=0D
>> Nobody review v4 for over a week.=0D
> =0D
> That's fine, but you need to say _why_ this is being resent, otherwise=0D
> we have no idea, and this just moves to the bottom of our review queue.=0D
"Nobody review v4 for over a week." was the reason. I should resubmit =0D
the same patch or ping instead of using "RESEND", is that what you mean?=0D
=0D
> =0D
> thanks,=0D
> =0D
> greg k-h=0D
thanks,=0D
=0D
Hongyu Xie=0D
