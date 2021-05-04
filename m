Content-Type: multipart/mixed; boundary="===============0287890376544689889=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [stable:linux-5.4.y 5541/6083] ERROR: "__memcat_p" [drivers/hwtracing/stm/stm_core.ko] undefined!
Date: Tue, 04 May 2021 09:41:14 +0200
Message-ID: <CAK8P3a30xJ1+zrCC4fk+q9xzLspHuE4VM0UHSWiU3-iFeNN+6g@mail.gmail.com>
In-Reply-To: <YJDQ0ePGHxmcB7dX@kroah.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0287890376544689889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 4, 2021 at 6:43 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Mon, May 03, 2021 at 09:16:42PM +0200, Arnd Bergmann wrote:
> > On Mon, May 3, 2021 at 7:00 PM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> > > > > >> ERROR: "__memcat_p" [drivers/hwtracing/stm/stm_core.ko] undefi=
ned!
> > > >
> > > > I'm fairly sure this is unrelated to my patch, but I don't see what
> > > > happened here.
> > >
> > > It's unrelated to your patch. It was fixed in 5.7 by
> > > 7273ad2b08f8ac9563579d16a3cf528857b26f49 and a few other dependencies
> > > according to https://github.com/ClangBuiltLinux/linux/issues/515.
> > >
> >
> > Ah right, the big hammer.
> >
> > Greg, not sure what we want to do here. Backporting
> >
> > 7273ad2b08f8 ("kbuild: link lib-y objects to vmlinux forcibly when
> > CONFIG_MODULES=3Dy")
> >
> > to v5.4 and earlier would be an easy workaround, but it has the potenti=
al
> > of adding extra bloat to the kernel image since it links in all other
> > library objects as well.
>
> I've lost the thread here, but what _real_ problem is happening here
> that doing the above is required?

Randconfig builds fail if drivers/hwtracing/stm/stm_core.ko is a loadable
modules and nothing inside vmlinux forces lib/memcat_p.o to be
linked in. A simpler workaround for v5.4 would be:

diff --git a/lib/Makefile b/lib/Makefile
index a5c5f342ade0..745d1207e9e2 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -33,7 +33,7 @@ lib-y :=3D ctype.o string.o vsprintf.o cmdline.o \
         flex_proportions.o ratelimit.o show_mem.o \
         is_single_threaded.o plist.o decompress.o kobject_uevent.o \
         earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
-        nmi_backtrace.o nodemask.o win_minmax.o memcat_p.o \
+        nmi_backtrace.o nodemask.o win_minmax.o \
         buildid.o

 lib-$(CONFIG_PRINTK) +=3D dump_stack.o
@@ -48,7 +48,7 @@ obj-y +=3D bcd.o sort.o parser.o debug_locks.o random32.o=
 \
         bsearch.o find_bit.o llist.o memweight.o kfifo.o \
         percpu-refcount.o rhashtable.o \
         once.o refcount.o usercopy.o errseq.o bucket_locks.o \
-        generic-radix-tree.o
+        generic-radix-tree.o memcat_p.o
 obj-$(CONFIG_STRING_SELFTEST) +=3D test_string.o
 obj-y +=3D string_helpers.o
 obj-$(CONFIG_TEST_STRING_HELPERS) +=3D test-string_helpers.o

which is the same as what 7273ad2b08f8 does, but only for this one file
instead of all of lib/*.o.

       Arnd
--===============0287890376544689889==--

