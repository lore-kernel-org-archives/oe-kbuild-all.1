Content-Type: multipart/mixed; boundary="===============1120538242817556907=="
MIME-Version: 1.0
From: John Ogness <john.ogness@linutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-rt-devel:linux-5.9.y-rt-rebase 60/234] kernel/printk/printk.c:2581:6: error: implicit declaration of function 'kernel_sync_mode'
Date: Thu, 22 Oct 2020 07:52:50 +0206
Message-ID: <87zh4e3j91.fsf@jogness.linutronix.de>
In-Reply-To: <20201021163446.oqnj7mmfxo3ydl5k@linutronix.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1120538242817556907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-10-21, Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> The allnoconfig is probably !CONFIG_PRINTK which is currently known to
> be broken. But since you complain let me look what I can do=E2=80=A6

Please do not spend time on this. I will look into it. Stubbing out
printk needs to be done correctly. I will get it to relatively soon. I
am sure you have more important things to dedicate your time to right
now.

John
--===============1120538242817556907==--

