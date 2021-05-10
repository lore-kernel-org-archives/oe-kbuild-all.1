Content-Type: multipart/mixed; boundary="===============2661701129340850636=="
MIME-Version: 1.0
From: Joe Perches <joe@perches.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2] HID: ft260: fix format type warning in ft260_word_show()
Date: Mon, 10 May 2021 09:41:57 -0700
Message-ID: <6a589bf720c5420e09bcc3c40b812bf6822d3a3d.camel@perches.com>
In-Reply-To: <20210510163029.2217-1-michael.zaidman@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2661701129340850636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-05-10 at 19:30 +0300, Michael Zaidman wrote:
> Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> =

> Fix warning reported by static analysis when built with W=3D1 for arm64 by
> clang version 13.0.0
> =

> > > drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short=
' but
> =C2=A0=C2=A0=C2=A0the argument has type 'int' [-Wformat]
[]
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
[]
> @@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev, i=
nt id, u8 *cfg, int len,
> =C2=A0	if (ret !=3D len && ret >=3D 0)
> =C2=A0		return -EIO;
> =C2=A0
> =

> -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
> =C2=A0}

This is likely a clang defect and not an actual problem.
If you are going to convert one of these, convert both.


--===============2661701129340850636==--

